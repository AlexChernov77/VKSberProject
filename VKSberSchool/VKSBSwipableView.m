//
//  VKSBSwipableView.m
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VKSBSwipableView.h"


@interface VKSBSwipableView()

@property (nonatomic) UINib *nib;
@property (nonatomic) UIView *customView;
@property (copy, nonatomic) NSArray *visibleView;
@property (assign, nonatomic) NSInteger visibleIndex;
@property (assign, nonatomic) NSInteger modelsCount;
@property (assign, nonatomic) NSInteger visivleReuseViewIndex;
@property (strong, nonatomic) UIView *swipeView;
@property (nonatomic, strong) NSMutableArray *views;

@end

@implementation VKSBSwipableView

- (void)registerNib:(NSMutableArray *)views
{
	self.views = views;
}

- (void)setDataSource:(id<SwipableViewsDataSource>)dataSource
{
	_dataSource = dataSource;
	[self setup];
}

- (void)setup
{
	self.clipsToBounds = NO;
	self.visibleIndex = 0;
	self.modelsCount = 0;
	self.visivleReuseViewIndex = 0;
	[self drawViews];
}

- (void)drawViews
{
	self.modelsCount = self.dataSource.numbersOfViews;
	if (self.dataSource.numbersOfViews == 0)
	{
		return;
	}
	NSInteger viewsNumber = self.dataSource.numbersOfViews >= 3 ? 3 : self.modelsCount;
	[self renderViews:viewsNumber index:self.visibleIndex];
	
}

- (void)reloadData
{
	if (self.modelsCount >= [self.dataSource numbersOfViews]) {
		return;
	}
	NSInteger dataDiff = [self.dataSource numbersOfViews] - self.modelsCount;
	NSInteger viewsDiff = dataDiff > 3 - [self.subviews count] ? 3 - [self.subviews count]  : dataDiff;
	
	self.modelsCount = [self.dataSource numbersOfViews];
	[self renderViews:viewsDiff index:self.visibleIndex];
}



- (void)renderViews:(NSInteger)number index:(NSInteger)startIndex
{
	NSMutableArray *viewsArray = [NSMutableArray new];
	NSInteger indexCounter = startIndex;
	
	for (int i = 0; i < number; i++)
	{
		UIView *rawView = self.views[i];
		
		[self.dataSource view:rawView atIndex:indexCounter];
		rawView.frame = self.bounds;
		[self insertSubview:rawView atIndex:0];
		[viewsArray addObject:rawView];
		indexCounter += 1;
	}
	
	self.visibleView = [viewsArray count] > 0 ?  viewsArray : self.visibleView;
	
	[self addRecognizers];
}


- (void)addRecognizers
{
	for (int i = 0; i < self.visibleView.count; i++)
	{
		UIView *view = self.visibleView[i];
		[self addPanGestureRecognizer:view];
	}
}

- (void)addPanGestureRecognizer : (UIView *)view
{
	UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
	
	[view addGestureRecognizer:recognizer];
}


- (void)move : (UIPanGestureRecognizer *)rec
{
	UIView *view = rec.view;
	CGPoint translation = [rec translationInView:self];
	CGFloat centerDiff = view.center.x - (self.bounds.size.width / 2.0);
	
	CGPoint newCenter = CGPointMake(self.bounds.size.width / 2.0 + translation.x, self.bounds.size.height / 2 + translation.y);
	view.center = newCenter;
	
	CGFloat rotator = self.bounds.size.width / 2 / 0.3;
	
	view.transform = CGAffineTransformMakeRotation(centerDiff / rotator);
	
	if (rec.state == UIGestureRecognizerStateEnded)
	{
		if (fabs(centerDiff) >= view.frame.size.width / 3 && centerDiff > 0)
		{
			//доводчик в лево
			[UIView animateWithDuration:0.1 animations:^{
				view.center = CGPointMake(view.center.x + 500, view.center.y);
			} completion:^(BOOL finished) {
				[self handleAction: right andView:view];
			}];
		} else if (fabs(centerDiff) >= view.frame.size.width / 3 && centerDiff < 0)
		{
			[UIView animateWithDuration:0.1 animations:^{
				view.center = CGPointMake(view.center.x - 500, view.center.y);
			} completion:^(BOOL finished) {
				[self handleAction: left andView:view];
			}];
		} else
		{
			//доводчик в центр
			[UIView animateWithDuration:0.2 animations:^{
				view.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
				view.transform = CGAffineTransformIdentity;
			}];
		}
	}
}

- (void)handleAction : (SwipeDirection) direction andView: (UIView *)view
{
	[self.delegate willSwiped:direction atIndex:self.visibleIndex];
	[view removeFromSuperview];
	
	if (self.modelsCount - self.visibleIndex <= 3)
	{
		if (self.visibleIndex < self.modelsCount)
		{
			self.visibleIndex += 1;
			return;
		}
	}
	
	self.visivleReuseViewIndex = self.visivleReuseViewIndex == 2 ? 0 : self.visivleReuseViewIndex + 1;
	
	[self.dataSource view:view atIndex:self.visibleIndex + 3];
	view.transform = CGAffineTransformIdentity;
	view.frame = self.bounds;
	[self insertSubview:view atIndex:0];
	self.visibleIndex += 1;
}

@end
