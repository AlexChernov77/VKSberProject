//
//  NetworkHelper.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject

-(NSURLRequest *)createGetRequest: (NSString *) baseURL vkMethod: (NSString *) method withParametrs: (NSDictionary *) paremetrs;

@end
