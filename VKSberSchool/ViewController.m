//
//  ViewController.m
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "ViewController.h"
#import "SwipableViewsDataSource.h"
#import "SwipableViewsDelegate.h"
#import "VKSBSwipableView.h"
#import "CustomView.h"

@interface ViewController()

@property (weak, nonatomic) IBOutlet UILabel *exampleLabel;
@property (nonatomic, strong) VKSBSwipableView *exampleView;
@property (weak, nonatomic) IBOutlet VKSBSwipableView *exeView;
@property (strong, nonatomic) CustomView *customView;
@property (nonatomic, strong) NSMutableArray *views;

@end

@interface ViewController ()<SwipableViewsDelegate, SwipableViewsDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//	self.exampleView = [VKSBSwipableView new];
//	self.exampleView.backgroundColor = UIColor.redColor;
//	self.exampleView.frame = CGRectMake(self.view.frame.size.width/2 - 40, self.view.frame.size.height/2 - 40, 80, 80);
//	[self.view addSubview:self.exampleView];
	self.views = [NSMutableArray new];
	for(int i = 0; i < 3; i++)
	{
		self.customView = [CustomView new];
		self.customView.backgroundColor = UIColor.blueColor;
		[self.views addObject:self.customView];
	}
	[self.exeView registerNib:self.views];
	self.exeView.dataSource = self;
	self.exeView.delegate = self;
}


- (void)willSwiped:(SwipeDirection )direction atIndex:(NSInteger)index
{
	
}

- (NSInteger)numbersOfViews
{
	return 10;
}

- (void)view:(UIView *)view atIndex:(NSInteger)index
{
	
}



@end
