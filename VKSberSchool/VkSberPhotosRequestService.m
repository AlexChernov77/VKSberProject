//
//  VkSberPhotosRequestService.m
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//
#import "VkSberPhotosRequestService.h"
#import "NSUserDefaultsService.h"
#import "NetworkService.h"
#import "NetworkConfigureRequestService.h"
#import "VkSberAlbumModel.h"
#import "Constant.h"


@interface VkSberPhotosRequestService()

@property (strong, nonatomic) NSUserDefaultsService *userDefaultsService;
@property (strong, nonatomic) NetworkService *nerworkService;
@property (strong, nonatomic) NetworkConfigureRequestService *nerworkHepler;
@property (copy, nonnull) NSString *userID;

@end


@implementation VkSberPhotosRequestService

- (instancetype) initWithUserID:(NSString *)userID
{
	if (self = [super init])
	{
		_userDefaultsService = [NSUserDefaultsService new];
		_nerworkService = [NetworkService new];
		_nerworkHepler = [NetworkConfigureRequestService new];
		_userID = userID;
	}
	return self;
}

- (void)getMyAlbum:(void (^) (NSDictionary *data))success
	  failureBlock:(void (^) (NSInteger code))failure
{
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	
	if (![self.userID  isEqual: @""])
	{
		[dictionary setObject: self.userID forKey:VkSberOwnerId];
	}
	
	[dictionary setObject: @(20) forKey:VkSberCount];
	[dictionary setObject: @(0) forKey:VkSberPhotoSizes];
	[dictionary setObject: @(0) forKey:VkSberOffset];
	[dictionary setObject: [self.userDefaultsService getAccessToken] forKey:VkSberToken];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberPhotosGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

- (void)getPhotos:(void (^) (NSArray *urlArray))completion
{
	[self getMyAlbum:^(NSDictionary *data) {
		NSMutableArray *urlArray = [NSMutableArray new];
		NSDictionary *photo = data[@"response"][@"items"];
		for (NSDictionary *imageJSON in photo)
		{
			NSArray *photo = imageJSON[@"sizes"];
			for (int i = 0 ; i < photo.count ; i++)
			{
				if ([photo[i][@"type"]  isEqual: @"z"])
				{
					NSString *url = (NSString *)photo[i][@"url"];
				
					VkSberAlbumModel *model = [[VkSberAlbumModel alloc] initWithURL:url];
					[urlArray addObject:model];
				}
			}
		}
		completion(urlArray);
	} failureBlock:^(NSInteger code) {
		NSLog(@"Обработка ошибки");
	}];
}

@end
