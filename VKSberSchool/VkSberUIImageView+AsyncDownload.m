//
//  UIImageView+AsyncDownload.m
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberUIImageView+AsyncDownload.h"

@implementation UIImageView (AsyncDownload)

- (void)loadImage: (NSString *) urlString
{
	NSURL *url = [[NSURL alloc] initWithString:urlString];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	NSURLSession *session;
	session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
	NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (data != NULL)
		{
			dispatch_async(dispatch_get_main_queue(), ^{
				UIImage *image = [[UIImage alloc] initWithData:data];
				self.image = image;
			});
		}
	}];
	[sessionDataTask resume];
}

@end
