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

@property (nonatomic, weak, nullable) id<VkSberPhotoAlbumPresenterInputProtocol> presenterInput;

- (instancetype)initWithUserID: (NSString *) userID;

@end

NS_ASSUME_NONNULL_END
