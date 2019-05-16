//
//  NetworkService.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkService : NSObject

- (void)load:(NSURLRequest *)request
successBlock:(void (^) (NSDictionary *data))success
failureBlock:(void (^) (NSInteger code))failure;

@end
