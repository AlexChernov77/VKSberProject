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
#import "VkSberProfileModel.h"
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
	
	[dictionary setObject:@"bdate,education,photo_max,city" forKey:VkSberFields];
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
	[dictionary setObject:@"bdate,education,photo_max,city" forKey:VkSberFields];
	[dictionary setObject: [self.userDefaultsService getAccessToken] forKey:VkSberToken];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberUserGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

-(void)getUsers: (void (^) (NSArray *urlArray)) completion
{
	[self getMyProfileInfo:^(NSDictionary *data) {
		NSMutableArray *urlArray = [NSMutableArray new];
		NSDictionary *user = data[@"response"];
		
		for (NSDictionary *imageJSON in user)
		{
			NSString *name = imageJSON[@"first_name"];
			NSString *url_m = imageJSON[@"photo_max"];
			NSString *education = imageJSON[@"university_name"] == nil ? @"Не указан" : imageJSON[@"university_name"];;
			NSString *bday = imageJSON[@"bdate"] == nil ? @"Не указан" : imageJSON[@"bdate"];
			NSString *lastName = imageJSON[@"last_name"];
			NSString *city = imageJSON[@"city"] == nil ? @"Не указан" : imageJSON[@"city"];;
			NSString *userName = [NSString stringWithFormat: @"%@ %@", name, lastName];
			
			VkSberProfileModel *model = [[VkSberProfileModel alloc] initWithUserName:userName birthday:bday city:city educations:education url:url_m];
			[urlArray addObject:model];
		}
		
		completion(urlArray);
	} failureBlock:^(NSInteger code) {
		NSLog(@"Обработка ошибки");
	}];
}

@end
