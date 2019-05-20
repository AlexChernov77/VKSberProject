//
//  VkSberFriendsPresenterProtocol.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol VkSberFriendsViewLoadedProtocol;

@protocol VkSberFriendsPresenterOutPutProtocol <NSObject>

- (NSInteger)numberOfEntities;
- (id)entityAt:(NSInteger)index;

@end

@protocol VkSberFriendsPresenterInputProtocol <NSObject>

- (void)viewLoaded:(id<VkSberFriendsViewLoadedProtocol>)view;

@end


