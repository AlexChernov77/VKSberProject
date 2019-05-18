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
#import "AppDelegate.h"
#import "Friends+CoreDataClass.h"
#import "VkSberCoreDataService.h"


@interface VkSberFriendsPresenter()

@property (nonatomic, copy) NSArray *friendsArray;
@property (nonatomic,strong) VkSberFriendsRequestService *service;
@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;
@property (nonatomic, strong) NSFetchRequest *fetchRequest;
@property (nonatomic,strong) VkSberCoreDataService *coreDataService;

@end


@implementation VkSberFriendsPresenter

- (instancetype)init
{
	if(self = [super init])
	{
		_service = [VkSberFriendsRequestService new];
		_coreDataService = [VkSberCoreDataService new];
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

- (NSArray *)updatedArray;
{
	NSError *error = nil;
	NSArray *result = [self.coreDataContext executeFetchRequest:self.fetchRequest ? : [Friends fetchRequest] error:&error];
	
	return result;
}

- (NSManagedObjectContext *)coreDataContext
{
	NSPersistentContainer *container = [self.coreDataService persistentContainer];
	NSManagedObjectContext *context = container.viewContext;
	
	return context;
}

- (NSFetchRequest *)fetchRequest
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Friends"];
	return fetchRequest;
}

- (void)viewLoaded:(id<VkSberFriendsViewLoadedProtocol>)view
{
	self.view = view;
	self.friendsArray = [self updatedArray];
	[self getFriendsList];
}

@end
