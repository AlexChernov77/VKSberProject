//
//  VkSberProfilePresenter.m
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberProfilePresenter.h"
#import "VkSberUserInfoService.h"
#import "VkSberProfileModel.h"

@interface VkSberProfilePresenter()

@property (nonatomic, strong) VkSberUserInfoService *service;
@property (nonatomic, strong) VkSberProfileModel *model;
@property (strong, nonnull) NSString *userID;

@end

@implementation VkSberProfilePresenter

-(instancetype)initWithUserId: (NSString *)userID
{
	if (self = [super init])
	{
		self.userID = userID;
		self.service = [[VkSberUserInfoService alloc] initWithUserID:userID];
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


@end
