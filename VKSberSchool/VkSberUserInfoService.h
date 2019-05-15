//
//  VkSberUserInfoService.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VkSberUserInfoService : NSObject

/**
  отпрака запроса на получение пользователей, отрабатывает блок compection при успехе
 */

- (void)getUsers: (void (^) (NSArray *urlArray)) completion;


/**
 Инициализирует акшен
 @param userID - айди пользователя
 @return action
 */

- (instancetype) initWithUserID: (NSString *) userID;

@end
