//
//  VkSberFriendsAssembly.m
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberFriendsAssembly.h"
#import "VkSberFriendsPresenter.h"
#import "VkSberFriendsPresenterProtocol.h"

@implementation VkSberFriendsAssembly

+ (void)assignView:(id<VkSberFriendsViewLoadedProtocol>)view
{
	VkSberFriendsPresenter *presenter = [VkSberFriendsPresenter new];	
	[view assign:presenter : presenter];
}

@end
