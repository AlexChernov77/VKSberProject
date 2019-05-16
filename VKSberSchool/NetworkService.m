//
//  NetworkService.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "NetworkService.h"

@implementation NetworkService

- (void)load: (NSURLRequest *)request
successBlock:(void (^) (NSDictionary *data))success
failureBlock:(void (^) (NSInteger code))failure
{
	NSURLSession *session;
	session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	
	NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (data != NULL)
		{
			NSDictionary *temp = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
			dispatch_async(dispatch_get_main_queue(), ^{
			success(temp);
			});
		}
		else
		{
			failure(error.code);
		}
	}];
	[sessionDataTask resume];
}

@end
