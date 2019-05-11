//
//  Constant.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "Constant.h"

NSString *const VkSberBaseUrl = @"https://api.vk.com/method/";

NSString *const VkSberUserGet = @"users.get";
NSString *const VkSberPhotosGet = @"photos.getAll";

NSString *const VkSberUserId = @"user_ids";
NSString *const VkSberOwnerId = @"owner_id";
NSString *const VkSberToken = @"access_token";
NSString *const VkSberOffset = @"offset";
NSString *const VkSberCount = @"count";
NSString *const VkSberPhotoSizes = @"photo_sizes";
NSString *const VkSberFields = @"fields";

NSString *const VkSberAuthURL = @"http://oauth.vk.com/authorize?client_id=6978175&scope=photos,friends&redirect_uri=oauth.vk.com/blank.html&display=touch&response_type=token";
