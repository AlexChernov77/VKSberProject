//
//  VkAuthService.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSUserDefaultsService.h"
#import <WebKit/WebKit.h>

@interface VkAuthService : NSObject

- (void)authorization: (void (^) (void)) success failureBlock: (void (^) (void)) failure authToken: (NSString *) token;
- (NSString*)stringBetweenString:(NSString*)start
					   andString:(NSString*)end
					 innerString:(NSString*)str;

@end
