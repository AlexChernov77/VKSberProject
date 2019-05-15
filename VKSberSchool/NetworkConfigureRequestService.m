//
//  NetworkConfigureRequestService.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "NetworkConfigureRequestService.h"
#import "NSUserDefaultsService.h"

@interface NetworkConfigureRequestService()

@property (strong, nonatomic) NSUserDefaultsService *userDefaultsService;

@end


@implementation NetworkConfigureRequestService

-(instancetype) init
{
	if (self = [super init])
	{
		_userDefaultsService = [NSUserDefaultsService new];
	}
	return self;
}

-(NSURLRequest *)createGetRequest: (NSString *) baseURL vkMethod: (NSString *) method withParametrs: (NSDictionary *) paremetrs
{
	NSString *requestString = [NSString stringWithFormat: @"%@%@?", baseURL, method];
	NSArray *keysArray = paremetrs.allKeys;
	
	for (int i = 0; i< keysArray.count; i++)
	{
		NSString *key = keysArray[i];
		NSString *value = paremetrs[key];
		
		requestString = [requestString stringByAppendingString: [NSString stringWithFormat: @"%@=%@&", key, value]];
	}
	requestString = [requestString stringByAppendingString: [NSString stringWithFormat: @"access_token=%@&", [self.userDefaultsService getAccessToken]]];
	requestString = [requestString stringByAppendingString: @"v=5.95"];
	
	NSLog(@"%@", requestString);
	
	NSMutableURLRequest *request = [NSMutableURLRequest new];
	
	request.HTTPMethod = @"GET";
	request.URL = [[NSURL alloc] initWithString:requestString];
	
	return request;
}

@end
