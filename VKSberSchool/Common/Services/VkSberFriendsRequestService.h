//
//  VkSberFriendsRequestService.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VkSberFriendsRequestService : NSObject

- (void)getFriends: (void (^) (NSArray *urlArray)) completion;

@end

