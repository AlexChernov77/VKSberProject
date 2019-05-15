//
//  VkSberProfilePresenter.m
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberProfilePresenter.h"
#import "VkSberPhotoAlbumViewController.h"
#import "VkSberUserInfoService.h"
#import "VkSberProfileModel.h"
#import "VkSberPhotoAlbumAssembly.h"

@interface VkSberProfilePresenter()

@property (nonatomic, strong) VkSberUserInfoService *service;
@property (nonatomic, strong) VkSberProfileModel *model;
@property (nonatomic, strong) VkSberPhotoAlbumAssembly *photoAssembly;
@property (strong, nonnull) NSString *userID;

@end

@implementation VkSberProfilePresenter

- (instancetype)initWithUserId: (NSString *)userID
{
	if (self = [super init])
	{
		self.userID = userID;
		self.service = [[VkSberUserInfoService alloc] initWithUserID:userID];
		self.photoAssembly = [VkSberPhotoAlbumAssembly new];
	}
	return self;
}



- (void)loadUser:(void (^)(VkSberProfileModel *))user
{
	[self.service getUsers:^(NSArray *urlArray) {
		self.model = urlArray.firstObject;
		user(self.model);
	}];
}

- (NSString *)getUserID
{
	return self.userID;
}

- (VkSberPhotoAlbumViewController *)perfomToPhoto
{
	return [self.photoAssembly buildPhoto:self.userID];
}



@end
