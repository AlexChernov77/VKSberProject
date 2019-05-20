//
//  VkSberPhotoAlbumPresenterProtocol.h
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VkSberPhotoAlbumPresenterOutPutProtocol <NSObject>

- (void)loadPhotos;
- (NSInteger)numberOfEntities;
- (id) entityAt:(NSInteger)index;

@end

@protocol VkSberPhotoAlbumPresenterInputProtocol <NSObject>

- (void)reloadData;

@end

