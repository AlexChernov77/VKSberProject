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
	self.service = nil;
	[super tearDown];
}

- (void)testAuthorizationSuccess
{
	//arrange
	__block BOOL wasCalled = NO;
	id success = ^(void) {
		wasCalled = YES;
	};
	
	id failure = ^(void) {
		
	};
	
	OCMStub([self.service success]).andReturn(success);
	OCMStub([self.service failure]).andReturn(failure);
	NSString *token = @"123456";
	OCMReject([self.service failure]);

	//act
	[self.service authorization:success failureBlock:failure authToken:token];
	
	//assert
	OCMVerify([self.service authorization:success failureBlock:failure authToken:token]);
	OCMVerify([self.service success]);
	XCTAssertTrue(wasCalled);
}

- (void)testAuthorizationFailure
{
	//arrange
	__block BOOL wasCalled = NO;
	
	id success = ^(void) {
		
	};
	
	id failure = ^(void) {
		wasCalled = YES;
	};
	
	OCMStub([self.service success]).andReturn(success);
	OCMStub([self.service failure]).andReturn(failure);
	NSString *token = @"";
	OCMReject([self.service success]);

	//act
	[self.service authorization:success failureBlock:failure authToken:token];
	
	//assert
	OCMVerify([self.service authorization:success failureBlock:failure authToken:token]);
	OCMVerify([self.service failure]);
	XCTAssertTrue(wasCalled);
}

- (void)testStringBetweenStringTrue
{
	//arrange
	NSString *text = @"https://oauth.vk.com/blank.html#access_token=1234567&expires_in=86400&user_id=333";
	NSString *token = @"1234567";
	
	//act
	NSString *tokenResult = [self.service stringBetweenString:@"access_token=" andString:@"&" innerString:text];
	
	//assert
	XCTAssertTrue([tokenResult isEqual:token]);
}

- (void)testStringBetweenStringFalse
{
	//arrange
	NSString *text = @"https://oauth.vk.com/blank.html#access_token=1234567&expires_in=86400&user_id=3333";
	NSString *token = @"12345678";
	
	//act
	NSString *tokenResult = [self.service stringBetweenString:@"access_token=" andString:@"&" innerString:text];
	
	//assert
	XCTAssertFalse([tokenResult isEqual:token]);
}

@end
