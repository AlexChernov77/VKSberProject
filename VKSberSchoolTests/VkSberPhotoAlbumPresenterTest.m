//
//  VkSberPhotoAlbumPresenterTest.m
//  VKSberSchoolTests
//
//  Created by Александр on 18/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "VkSberPhotoAlbumPresenter.h"
#import "VkSberPhotosRequestService.h"

@interface VkSberPhotoAlbumPresenter()

@property (nonatomic,strong) VkSberPhotosRequestService *service;
@property (nonatomic, copy) NSArray *photoArray;

@end

@interface VkSberPhotoAlbumPresenterTest : XCTestCase

@property (nonatomic,strong) VkSberPhotoAlbumPresenter *presenter;
@property (nonatomic,strong) VkSberPhotosRequestService *service;

@end


@implementation VkSberPhotoAlbumPresenterTest

- (void)setUp
{
	[super setUp];
	self.presenter = OCMPartialMock([VkSberPhotoAlbumPresenter new]);
	
	self.service = OCMPartialMock([VkSberPhotosRequestService new]);
	OCMStub([self.presenter service]).andReturn(self.service);
	
}

- (void)tearDown
{
	self.service = nil;
	self.presenter = nil;
	[super tearDown];
}

- (void)testLoadPhoto
{
	//arrange
	OCMStub([self.service getPhotos:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
		void (^block)(NSArray *array) = nil;
		[invocation getArgument:&block atIndex:2];
		block(@[@"1"]);
	});
	
	//act
	[self.presenter loadPhotos];
	
	//assert
	OCMVerify([self.service getPhotos:[OCMArg any]]);
	XCTAssertTrue([self.presenter.photoArray count] == 1);
}

- (void)testNumberOfEntities
{
	//arrange
	NSArray *array = @[@"1",@"2",@"3"];
	NSInteger count = [array count];
	
	OCMStub([self.presenter photoArray]).andReturn(array);
	//act
	
	//assert
	XCTAssertTrue(count == [self.presenter.photoArray count]);
}

- (void)testEntityAtNil
{
	//arrange
	NSArray *array = @[@"1",@"2",@"3"];
	
	OCMStub([self.presenter photoArray]).andReturn(array);
	
	//act
	id object = [self.presenter entityAt:5];
	
	//assert
	XCTAssertNil(object);
}

- (void)testEntityAtNotNil
{
	//arrange
	NSArray *array = @[@"1",@"2",@"3"];
	
	OCMStub([self.presenter photoArray]).andReturn(array);
	
	//act
	id object = [self.presenter entityAt:1];
	
	//assert
	XCTAssertNotNil(object);
}


@end

