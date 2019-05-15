//
//  SwipableViewsDelegate.h
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

typedef NS_ENUM(NSUInteger, SwipeDirection)
{
	left,
	right
};

@protocol SwipableViewsDelegate <NSObject>

- (void) willSwiped: (SwipeDirection) direction atIndex: (NSInteger) index;

@end
