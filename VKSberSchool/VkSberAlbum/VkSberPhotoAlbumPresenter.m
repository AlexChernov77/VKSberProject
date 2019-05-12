//
//  VkSberPhotoAlbumPresenter.m
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberPhotoAlbumPresenter.h"
#import "VkSberPhotosRequestService.h"

@interface VkSberPhotoAlbumPresenter()

@property (nonatomic,strong) VkSberPhotosRequestService *service;
@property (nonatomic, copy) NSArray *photoArray;

@end

@implementation VkSberPhotoAlbumPresenter

- (instancetype)initWithUserID: (NSString *)userID
{
	if (self = [super init])
	{
		self.service = [[VkSberPhotosRequestService alloc] initWithUserID: userID];
	}
	return self;
}

- (void)loadPhotos
{
	[self.service getPhotos:^(NSArray *urlArray) {
		self.photoArray = urlArray;
		[self.presenterInput reloadData];
	}];
}

- (id)entityAt:(NSInteger)index
{
	if ([self.photoArray count] - 1 < index)
	{
		return nil;
	}
	else
	{
		return self.photoArray[index];
	}
}


- (long long)numberOfEntities
{
	return self.photoArray.count;
}


@end
