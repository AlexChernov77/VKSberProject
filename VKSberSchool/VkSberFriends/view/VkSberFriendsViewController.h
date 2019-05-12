//
//  VkSberFriendsViewController.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VkSberFriendsViewLoadedProtocol.h"

@interface VkSberFriendsViewController : UIViewController<VkSberFriendsViewLoadedProtocol>

@property (nonatomic, strong, nullable) id<VkSberFriendsPresenterOutPutProtocol> presenterOutput;
@property (nonatomic, strong, nullable) id<VkSberFriendsPresenterInputProtocol> presenterInput;

@end

