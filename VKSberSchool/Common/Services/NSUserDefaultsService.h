//
//  NSUserDefaultsService.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaultsService : NSObject

- (void)saveAccessToken: (NSString *) searchString;
- (NSString *)getAccessToken;

@end

NS_ASSUME_NONNULL_END
