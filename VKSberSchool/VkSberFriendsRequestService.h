//
//  VkSberFriendsRequestService.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VkSberFriendsRequestService : NSObject

/**
 отпрака запроса на получение друзей, отрабатывает блок compection при успехе
 */

- (void)getFriends:(void (^) (NSArray *urlArray))completion;

@end

