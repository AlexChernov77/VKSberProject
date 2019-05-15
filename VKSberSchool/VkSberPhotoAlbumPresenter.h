//
//  VkSberPhotoAlbumPresenter.h
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VkSberPhotoAlbumPresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VkSberPhotoAlbumPresenter : NSObject <VkSberPhotoAlbumPresenterOutPutProtocol>

/**
 делегат вью
 */

@property (nonatomic, weak, nullable) id<VkSberPhotoAlbumPresenterInputProtocol> presenterInput;

/**
 Инициализирует presenter
 @param userID - userID
 @return presenter
 */

- (instancetype)initWithUserID: (NSString *) userID;

@end

NS_ASSUME_NONNULL_END
