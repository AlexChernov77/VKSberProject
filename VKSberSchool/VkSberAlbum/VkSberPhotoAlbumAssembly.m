//
//  VkSberPhotoAlbumAssembly.m
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberPhotoAlbumAssembly.h"
#import "VkSberPhotoAlbumPresenter.h"

@implementation VkSberPhotoAlbumAssembly

-(VkSberPhotoAlbumViewController *)buildPhoto : (NSString *)userID
{
	VkSberPhotoAlbumViewController *viewController = [VkSberPhotoAlbumViewController new];
	VkSberPhotoAlbumPresenter *presenter = [[VkSberPhotoAlbumPresenter alloc] initWithUserID:userID];
	presenter.presenterInput = viewController;
	viewController.presenterOutput = presenter;
	return viewController;
}

@end
