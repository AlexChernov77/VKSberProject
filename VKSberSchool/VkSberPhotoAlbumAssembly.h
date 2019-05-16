//
//  VkSberPhotoAlbumAssembly.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VkSberPhotoAlbumViewController.h"

@interface VkSberPhotoAlbumAssembly : NSObject

/**
 сборка модуля альбома
 */

- (VkSberPhotoAlbumViewController *)buildPhoto:(NSString *)userID;

@end

