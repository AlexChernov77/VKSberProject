//
//  CustomView.h
//  VKSberSchool
//
//  Created by Александр on 02/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VkSberAlbumModel.h"

@interface CustomView : UIView

/**
 отрисовка ячейки
 */

-(void)configureSelf: (VkSberAlbumModel *) model;

@end
