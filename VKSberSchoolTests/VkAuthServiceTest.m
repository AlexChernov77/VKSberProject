//
//  VkAuthServiceTest.m
//  VKSberSchoolTests
//
//  Created by Александр on 17/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VkAuthService.h"
#import <OCMock/OCMock.h>

@interface VkAuthService(Test)

@property void(^success)(void);
@property void(^failure)(void);
@property (strong, nonatomic) WKWebView *authWebView;

@end


@interface VkAuthServiceTest : XCTestCase

@property void(^success)(void);
@property void(^failure)(void);
@property (nonatomic,strong) VkAuthService *service;

@end

@implementation VkAuthServiceTest

- (void)setUp
{
	[super setUp];
	self.service = OCMPartialMock([VkAuthService new]);
}

- (void)tearDown
{
	
	[super tearDown];
}

- (void)testAuthorizationSuccess
{
	//arrange
	id success = ^(void) {
		
	};
	
	id failure = ^(void) {
		
	};
	OCMStub([self.service success]).andReturn(success);
	OCMStub([self.service failure]).andReturn(failure);
	NSString *token = @"123456";
	
	//act
	[self.service authorization:success failureBlock:failure authToken:token];
	
	//assert
	OCMVerify([self.service authorization:success failureBlock:failure authToken:token]);
	OCMVerify([self.service success]);
	OCMReject([self.service failure]);
}

- (void)testAuthorizationFailure
{
	//arrange
	id success = ^(void) {
		
	};
	
	id failure = ^(void) {
		
	};
	
	OCMStub([self.service success]).andReturn(success);
	OCMStub([self.service failure]).andReturn(failure);
	NSString *token = @"";
	
	//act
	[self.service authorization:success failureBlock:failure authToken:token];
	
	//assert
	OCMVerify([self.service authorization:success failureBlock:failure authToken:token]);
	OCMVerify([self.service failure]);
	OCMReject([self.service success]);
}

@end
