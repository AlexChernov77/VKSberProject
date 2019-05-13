//
//  VkSberPhotosRequestService.h
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VkSberPhotosRequestService : NSObject


/**
 Инициализирует акшен
 @param userID - айди пользователя
 @return action
 */

-(instancetype) initWithUserID: (NSString *) userID;


/**
 отпрака запроса на получение фотографий, отрабатывает блок compection при успехе
 */

-(void)getPhotos: (void (^) (NSArray *urlArray)) completion;


@end

