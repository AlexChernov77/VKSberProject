//
//  VkSberProfilePresenterProtocol.h
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VkSberPhotoAlbumViewController.h"
#import "VkSberProfileModel.h"

@protocol VkSberProfilePresenterProtocol <NSObject>

- (void)loadUser:(void (^) (VkSberProfileModel *user))user;
- (NSString *)getUserID;
- (VkSberPhotoAlbumViewController *)perfomToPhoto;

@end

