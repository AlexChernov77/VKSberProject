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

-(void)configureCell: (VkSberFriendsModel *)model;

@end
