//
//  VkSberFriendsViewLoadedProtocol.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VkSberFriendsPresenterProtocol.h"

@protocol VkSberFriendsViewLoadedProtocol <NSObject>

-(void) reloadData;
-(void) assign: (id<VkSberFriendsPresenterInputProtocol>) presenterInput : (id<VkSberFriendsPresenterOutPutProtocol>) presenterOutput;

@end
