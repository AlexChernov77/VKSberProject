//
//  VkSberFriendsPresenter.m
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberFriendsPresenter.h"
#import "VkSberFriendsPresenterProtocol.h"
#import "VkSberFriendsRequestService.h"
#import "VkSberFriendsModel.h"

@interface VkSberFriendsPresenter()

@property (nonatomic, copy) NSArray *friendsArray;
@property (nonatomic,strong) VkSberFriendsRequestService *service;

@end

@implementation VkSberFriendsPresenter

-(instancetype)init
{
	if(self = [super init])
	{
		_service = [VkSberFriendsRequestService new];
	}
	return self;
}


- (long long)numberOfEntities
{
	return self.friendsArray.count;
}

- (id)entityAt:(NSInteger)index
{
	if ([self.friendsArray count] - 1 < index)
	{
		return nil;
	}
	else
	{
		return self.friendsArray[index];
	}
}

- (void)getFriendsList
{
	[self.service getFriends:^(NSArray *urlArray) {
		self.friendsArray = urlArray;
		[self.view reloadData];
	}];
}

- (void)viewLoaded:(id<VkSberFriendsViewLoadedProtocol>)view
{
	self.view = view;
	[self getFriendsList];
}

@end
