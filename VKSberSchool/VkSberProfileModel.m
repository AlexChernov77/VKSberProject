//
//  VkSberProfileModel.m
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberProfileModel.h"

@implementation VkSberProfileModel

- (instancetype)initWithUserName:(NSString *)name
					    birthday:(NSString *)bday
						    city:(NSString *)city
					  educations:(NSString *) education
							 url:(NSString *)photoUrl

{
	if (self = [super init])
	{
		_userName = name;
		_education = education;
		_city = city;
		_bDay = bday;
		_photoURL = photoUrl;
	}
	return self;
}

@end
