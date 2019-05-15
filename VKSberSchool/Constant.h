//
//  Constant.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - Base URL

extern NSString *const VkSberBaseUrl; /**< основной url */
extern NSString *const VkSberAuthURL; /**< url авторизации */

#pragma mark - Methods

extern NSString *const VkSberUserGet; /**< user.get */
extern NSString *const VkSberPhotosGet; /**< get.all */
extern NSString *const VkSberFriendsGet; /**< friends.get */


#pragma mark - Arguments

extern NSString *const VkSberToken; /**< Токен авторизации */
extern NSString *const VkSberUserId; /**< айди пользователя */
extern NSString *const VkSberOwnerId; /**< айди друга*/
extern NSString *const VkSberPhotoSizes; /**< размер фото*/
extern NSString *const VkSberCount; /**< количетство фоток */
extern NSString *const VkSberOffset; /**< отступ */
extern NSString *const VkSberFields; /**< поля которые передаем в запрос */
