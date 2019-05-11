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
#import "NetworkHelper.h"
#import "VkSberAlbumModel.h"
#import "Constant.h"

@interface VkSberPhotosRequestService()

@property (strong, nonatomic) NSUserDefaultsService *userDefaultsService;
@property (strong, nonatomic) NetworkService *nerworkService;
@property (strong, nonatomic) NetworkHelper *nerworkHepler;

@end

@implementation VkSberPhotosRequestService

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

-(void)getMyAlbum: (void (^) (NSDictionary *data)) success
		  failureBlock : (void (^) (NSInteger code)) failure
{
	
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	
	[dictionary setObject: @(10) forKey:VkSberCount];
	[dictionary setObject: @(0) forKey:VkSberPhotoSizes];
	[dictionary setObject: @(0) forKey:VkSberOffset];
	[dictionary setObject: [self.userDefaultsService getAccessToken] forKey:VkSberToken];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberPhotosGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

-(void)getFriendsPhoto: (NSString *) userID
	 successBlock : (void (^) (NSDictionary *data)) success
	 failureBlock : (void (^) (NSInteger code)) failure
{
	
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	
	[dictionary setObject: userID forKey:VkSberUserId];
	[dictionary setObject: @(1) forKey:VkSberCount];
	[dictionary setObject: @(0) forKey:VkSberPhotoSizes];
	[dictionary setObject: @(0) forKey:VkSberOffset];
	[dictionary setObject: [self.userDefaultsService getAccessToken] forKey:VkSberToken];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberUserGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

-(void)getPhotos: (void (^) (NSArray *urlArray)) completion
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
