//
//  VkSberUserInfoService.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VkSberUserInfoService : NSObject

-(void)getUsers: (void (^) (NSArray *urlArray)) completion;
-(instancetype) initWithUserID: (NSString *) userID;

@end
