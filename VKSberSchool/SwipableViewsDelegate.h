//
//  SwipableViewsDelegate.h
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

typedef enum
{
	left,
	right
} SwipeDirection;

@protocol SwipableViewsDelegate <NSObject>

- (void) willSwiped: (SwipeDirection) direction atIndex: (NSInteger) index;

@end
