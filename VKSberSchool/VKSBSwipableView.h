//
//  VKSBSwipableView.h
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipableViewsDataSource.h"
#import "SwipableViewsDelegate.h"


@interface VKSBSwipableView : UIView

@property(weak,nonatomic) id<SwipableViewsDataSource> dataSource;
@property(weak,nonatomic) id<SwipableViewsDelegate> delegate;


/**
 регистрируем массив View которые будем вайпать
 */

- (void)registerNib:(NSMutableArray *)views;
- (void)handleAction:(SwipeDirection)direction andView:(UIView *)view;
- (void)reloadData;

@end

