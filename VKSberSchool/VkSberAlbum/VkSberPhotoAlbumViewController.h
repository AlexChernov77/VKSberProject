//
//  VkSberPhotoAlbumViewController.h
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VkSberPhotoAlbumPresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VkSberPhotoAlbumViewController : UIViewController<VkSberPhotoAlbumPresenterInputProtocol>

@property (nonatomic, strong, nullable) id<VkSberPhotoAlbumPresenterOutPutProtocol> presenterOutput;

@end

NS_ASSUME_NONNULL_END
