//
//  VkSberProfilePresenterTest.m
//  VKSberSchoolTests
//
//  Created by Александр on 17/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "VkSberProfilePresenter.h"
#import "VkSberPhotoAlbumViewController.h"
#import "VkSberUserInfoService.h"
#import "VkSberProfileModel.h"
#import "VkSberPhotoAlbumAssembly.h"

@interface VkSberProfilePresenter(Tests)

@property (nonatomic,strong) VkSberUserInfoService *service;
@property (nonatomic,strong) VkSberProfileModel *model;
@property (nonatomic,strong) VkSberPhotoAlbumAssembly *photoAssembly;
@property (copy,nonnull) NSString *userID;

@end

@interface VkSberProfilePresenterTest : XCTestCase

@property (nonatomic,strong) VkSberProfilePresenter *presenter;
@property (nonatomic,strong) VkSberPhotoAlbumAssembly *assembly;
@property (nonatomic,strong) VkSberUserInfoService *service;
@property (nonatomic,strong) VkSberProfileModel *model;

@end


@implementation VkSberProfilePresenterTest

- (void)setUp
{
	[super setUp];
	self.presenter = OCMPartialMock([VkSberProfilePresenter new]);
	self.assembly = OCMPartialMock([VkSberPhotoAlbumAssembly new]);
	OCMStub([self.presenter photoAssembly]).andReturn(self.assembly);
	
	self.service = OCMPartialMock([VkSberUserInfoService new]);
	OCMStub([self.presenter service]).andReturn(self.service);
	
	self.model = OCMPartialMock([[VkSberProfileModel alloc] initWithUserName:@"Иван" birthday:@"Иван" city:@"Иван" educations:@"Иван" url:@"Иван"]);
	OCMStub([self.presenter model]).andReturn(self.model);
}

- (void)tearDown
{
	self.presenter = nil;
	self.assembly = nil;
	self.service = nil;
	self.model = nil;
	[super tearDown];
}

- (void)testPerfomToPhoto
{
	//arrange
	NSString *userID = @"123456";
	OCMStub(self.presenter.userID).andReturn(userID);
	OCMStub([self.assembly buildPhoto:userID]);
	
	//act
	[self.presenter perfomToPhoto];
	
	//assert
	OCMVerify([self.assembly buildPhoto:userID]);
}

- (void)testLoadUser
{
	//arrange
	__block id expectedUser = nil;
	id blk = ^(VkSberProfileModel *user) {
		expectedUser = user;
	};
	
	OCMStub([self.service getUsers:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
		void (^block)(NSArray *array) = nil;
		[invocation getArgument:&block atIndex:2];
		block(@[self.model]);
	});
	
	//act
	[self.presenter loadUser:blk];
	
	//assert
	OCMVerify([self.service getUsers:[OCMArg any]]);
	XCTAssertTrue([expectedUser isEqual:self.model]);
}

@end
