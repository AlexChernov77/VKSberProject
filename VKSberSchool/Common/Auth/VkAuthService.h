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

/**
 авторизация, отрабатывает блок success при успехе, failure при не удаче
 */

- (void)authorization: (void (^) (void)) success failureBlock: (void (^) (void)) failure authToken: (NSString *) token;


/**
 Обрезает лишний текст для получения токена
@param start - заголовок
@param end - заголовок
@param str - заголовок
 @return string
 */

- (NSString*)stringBetweenString:(NSString*)start
					   andString:(NSString*)end
					 innerString:(NSString*)str;

@end
