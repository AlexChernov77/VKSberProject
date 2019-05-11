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

@end

@implementation VkSberProfilePresenter

-(instancetype)init
{
	if (self = [super init])
	{
		self.service = [VkSberUserInfoService new];
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

@end
