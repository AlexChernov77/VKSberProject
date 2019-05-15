//
//  VkSberEmptyLoadingView.m
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberEmptyLoadingView.h"

@interface VkSberEmptyLoadingView()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation VkSberEmptyLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame])
	{
		_activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
		[self setupActivityIndicator];
	}
	
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self layoutActivityIndicator];
}

- (void)setupActivityIndicator
{
	self.activityIndicator.color = UIColor.grayColor;
	self.backgroundColor = UIColor.blackColor;
	[self addSubview:self.activityIndicator];
}

- (void)layoutActivityIndicator
{
	[self.activityIndicator startAnimating];
	self.activityIndicator.center = self.center;
}

@end
