//
//  VkSberUserInfoService.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberUserInfoService.h"
#import "NSUserDefaultsService.h"
#import "NetworkService.h"
#import "NetworkHelper.h"
#import "Constant.h"

@interface VkSberUserInfoService()

@property (strong, nonatomic) NSUserDefaultsService *userDefaultsService;
@property (strong, nonatomic) NetworkService *nerworkService;
@property (strong, nonatomic) NetworkHelper *nerworkHepler;

@end

@implementation VkSberUserInfoService

-(instancetype) init
{
	if (self = [super init])
	{
		_userDefaultsService = [NSUserDefaultsService new];
		_nerworkService = [NetworkService new];
		_nerworkHepler = [NetworkHelper new];
	}
	return self;
}

-(void)getMyProfileInfo: (void (^) (NSDictionary *data)) success
		  failureBlock : (void (^) (NSInteger code)) failure
{
	
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	
	[dictionary setObject:@"bdate,education,photo_200_orig,city" forKey:VkSberFields];
	[dictionary setObject: [self.userDefaultsService getAccessToken] forKey:VkSberToken];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberUserGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

-(void)getUserInfo: (NSString *) userID
	 successBlock : (void (^) (NSDictionary *data)) success
	 failureBlock : (void (^) (NSInteger code)) failure
{
	
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	
	[dictionary setObject: userID forKey:VkSberUserId];
	[dictionary setObject:@"bdate,education,photo_200_orig,city" forKey:VkSberFields];
	[dictionary setObject: [self.userDefaultsService getAccessToken] forKey:VkSberToken];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberUserGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

@end
