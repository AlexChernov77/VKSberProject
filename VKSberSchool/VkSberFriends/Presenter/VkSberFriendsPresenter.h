//
//  VkSberFriendsPresenter.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VkSberFriendsViewLoadedProtocol.h"


@interface VkSberFriendsPresenter : NSObject<VkSberFriendsPresenterOutPutProtocol, VkSberFriendsPresenterInputProtocol>

/**
 делегат вью
 */

@property (nonatomic, weak, nullable) id<VkSberFriendsViewLoadedProtocol> view;

@end

