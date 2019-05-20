//
//  VkSberAlbumModel.h
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VkSberAlbumModel : NSObject

@property (nonatomic, copy) NSString *photoURL;

/**
 Инициализирует model
 @param photoUrl - url
 @return model
 */

- (instancetype)initWithURL:(NSString *)photoUrl;

@end

