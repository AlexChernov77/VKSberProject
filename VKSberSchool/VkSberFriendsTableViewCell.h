//
//  VkSberFriendsTableViewCell.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VkSberFriendsModel.h"


@interface VkSberFriendsTableViewCell : UITableViewCell

/**
 метод который отрисовывает ячейку
 */

- (void)configureCell:(VkSberFriendsModel *)model;

@end
