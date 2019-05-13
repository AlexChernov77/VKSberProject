//
//  VkSberProfileViewController.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VkSberProfilePresenterProtocol.h"

@interface VkSberProfileViewController : UIViewController

/**
 делегат презентера
 */

@property (nonatomic, strong, nullable) id<VkSberProfilePresenterProtocol> presenterOutput;

@end

