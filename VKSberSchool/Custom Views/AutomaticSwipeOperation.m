//
//  AutomaticSwipeOperation.m
//  VKSberSchool
//
//  Created by Александр on 02/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "AutomaticSwipeOperation.h"
#import "SwipableViewsDelegate.h"
#import "VKSBSwipableView.h"


@interface AutomaticSwipeOperation()

@property (nonatomic, assign) SwipeDirection direction;
@property (nonatomic, assign) VKSBSwipableView *superview;
@property (nonatomic, copy) void (^success)(void);
@property (nonatomic, assign) UIView *view;

@end

@implementation AutomaticSwipeOperation

-(instancetype)initWithDirection : (SwipeDirection) direction
				  andSuccesBlock : (void(^) (void)) success
					andSuperView : (VKSBSwipableView *) superView
{
	if (self = [super init])
	{
		_success = success;
		_superview = superView;
		_direction = direction;
	}
	return self;
}

- (void)main
{
	dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
	
	dispatch_async(dispatch_get_main_queue(), ^{
		self.view = self.superview.subviews.lastObject;
		
		CGPoint newCenter = self.direction == left ? CGPointMake(self.view.center.x - 500, self.view.center.y) :
		CGPointMake(self.view.center.x + 500, self.view.center.y);
		
		
		[UIView animateWithDuration:0.5 animations:^{
			self.view.center = newCenter;
			double centerDiff = self.view.center.x - (self.superview.bounds.size.width / 2.0);
			double rotator = self.superview.bounds.size.width / 2 / 0.3;
			
			self.view.transform = CGAffineTransformMakeRotation(centerDiff / rotator);
		} completion:^(BOOL finished) {
			if (finished)
			{
				[self.superview handleAction:self.direction andView:self.view];
				self.success();
				dispatch_semaphore_signal(semaphore);
			}
		}];
	});
	
	dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}
@end
