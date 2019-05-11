//
//  VkAuthService.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkAuthService.h"

@interface VkAuthService()

@property void(^success)(void);
@property void(^failure)(void);
@property (strong, nonatomic) WKWebView *authWebView;

@end

@implementation VkAuthService


- (void)authorization: (void (^) (void)) success failureBlock: (void (^) (void)) failure authToken: (NSString *) token
{
	self.success = success;
	self.failure = failure;
	
	if (![token isEqual: @""])
	{
		NSLog(@"ТОКЕН %@", token);
		self.success();
	}
	else {
		self.failure();
	}
}


#pragma mark - Methods

- (NSString*)stringBetweenString:(NSString*)start
					   andString:(NSString*)end
					 innerString:(NSString*)str
{
	NSScanner* scanner = [NSScanner scannerWithString:str];
	[scanner setCharactersToBeSkipped:nil];
	[scanner scanUpToString:start intoString:NULL];
	if ([scanner scanString:start intoString:NULL]) {
		NSString* result = nil;
		if ([scanner scanUpToString:end intoString:&result]) {
			return result;
		}
	}
	return nil;
}


@end
