//
//  VkSberFriendsRequestService.m
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberFriendsRequestService.h"
#import "NSUserDefaultsService.h"
#import "VkSberFriendsModel.h"
#import "NetworkService.h"
#import "NetworkHelper.h"
#import "Constant.h"

@interface VkSberFriendsRequestService()

@property (strong, nonatomic) NSUserDefaultsService *userDefaultsService;
@property (strong, nonatomic) NetworkService *nerworkService;
@property (strong, nonatomic) NetworkHelper *nerworkHepler;

@end

@implementation VkSberFriendsRequestService

- (instancetype) init
{
	if (self = [super init])
	{
		_userDefaultsService = [NSUserDefaultsService new];
		_nerworkService = [NetworkService new];
		_nerworkHepler = [NetworkHelper new];
	}
	return self;
}

- (void)getFriendsList: (void (^) (NSDictionary *data)) success
		  failureBlock : (void (^) (NSInteger code)) failure
{
	
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	
	[dictionary setObject:@"photo_100" forKey:VkSberFields];
	[dictionary setObject: [self.userDefaultsService getAccessToken] forKey:VkSberToken];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberFriendsGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

- (void)getFriends: (void (^) (NSArray *urlArray)) completion
{
	[self getFriendsList:^(NSDictionary *data) {
		NSMutableArray *friendsArray = [NSMutableArray new];
		NSDictionary *user = data[@"response"];
		
		NSArray *array = user[@"items"];
		
		for (int i = 0; i <array.count; i++)
		{
			NSDictionary *friend = array[i];
			
			NSString *name = friend[@"first_name"];
			NSString *lastName = friend[@"last_name"];
			NSString *url_m = friend[@"photo_100"];
			NSString *userId = friend[@"id"];
			NSString *userName = [NSString stringWithFormat: @"%@ %@", name, lastName];
			
			VkSberFriendsModel *model = [[VkSberFriendsModel alloc] initWithUserName:userName userID:userId url:url_m];
			[friendsArray addObject:model];
			
		}
		
		completion(friendsArray);
	} failureBlock:^(NSInteger code) {
		NSLog(@"Обработка ошибки");
	}];
}

@end
