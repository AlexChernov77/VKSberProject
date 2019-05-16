//
//  VkSberFriendsModel.m
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberFriendsModel.h"

@implementation VkSberFriendsModel

- (instancetype)initWithUserName:(NSString *)userName
					      userID:(NSString *)userID
							 url:(NSString *)photoUrl
{
	if (self = [super init])
	{
		_userName = userName;
		_userID = userID;
		_photoURL = photoUrl;
	}
	return self;
}

@end
