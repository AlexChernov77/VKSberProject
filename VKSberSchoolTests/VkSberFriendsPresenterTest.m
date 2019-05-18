//
//  VkSberFriendsPresenterTest.m
//  VKSberSchoolTests
//
//  Created by Александр on 17/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "VkSberFriendsPresenter.h"
#import "VkSberFriendsRequestService.h"

@interface VkSberFriendsPresenter(Test)

@property (nonatomic, copy) NSArray *friendsArray;
@property (nonatomic,strong) VkSberFriendsRequestService *service;

@end


@interface VkSberFriendsPresenterTest : XCTestCase

@property (nonatomic,strong) VkSberFriendsRequestService *service;
@property (nonatomic,strong) VkSberFriendsPresenter *presenter;

@end

@implementation VkSberFriendsPresenterTest

- (void)setUp
{
	[super setUp];
	self.presenter = OCMPartialMock([VkSberFriendsPresenter new]);
	
	self.service = OCMPartialMock([VkSberFriendsRequestService new]);
	OCMStub([self.presenter service]).andReturn(self.service);
}

- (void)tearDown
{
	[super tearDown];
}

- (void)testNumberOfEntities
{
	//arrange
	NSArray *array = @[@"1",@"2",@"3"];
	
	NSInteger count = [array count];
	
	OCMStub([self.presenter friendsArray]).andReturn(array);
	
	//act

	//assert
	XCTAssertTrue(count == [self.presenter.friendsArray count]);
}

- (void)testEntityAtNil
{
	//arrange
	NSArray *array = @[@"1",@"2",@"3"];
	
	OCMStub([self.presenter friendsArray]).andReturn(array);
	
	
	//act
	id object = [self.presenter entityAt:5];
	
	//assert
	
	XCTAssertNil(object);
}

- (void)testEntityAtNotNil
{
	//arrange
	NSArray *array = @[@"1",@"2",@"3"];
	
	OCMStub([self.presenter friendsArray]).andReturn(array);
		
	//act
	id object = [self.presenter entityAt:1];
	
	//assert
	
	XCTAssertNotNil(object);
}

@end
