//
//  NSUserDefaultsService.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "NSUserDefaultsService.h"


@interface NSUserDefaultsService()

@property (nonatomic, strong) NSUserDefaults* userDefaults;

@end


@implementation NSUserDefaultsService

- (instancetype)init
{
	if (self = [super init])
	{
		self.userDefaults = [NSUserDefaults new];
	}
	
	return self;
}

- (void)saveAccessToken:(NSString *)searchString
{
	[self.userDefaults setObject:searchString forKey:@"accessToken"];
}

- (NSString *)getAccessToken
{
	return [self.userDefaults stringForKey:@"accessToken"];
}

@end
