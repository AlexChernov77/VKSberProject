//
//  VkSberFriendsModel.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VkSberFriendsModel : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *photoURL;
@property (nonatomic, copy) NSString *userName;

/**
 Инициализирует модель
 @param userName - имя
 @param userID - др
 @param photoUrl - город
 @return action
 */

- (instancetype)initWithUserName:(NSString *)userName
						  userID:(NSString *)userID
							 url:(NSString *)photoUrl;

@end

