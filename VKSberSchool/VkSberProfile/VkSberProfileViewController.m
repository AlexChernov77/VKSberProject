//
//  VkSberProfileViewController.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberProfileViewController.h"
#import "VkSberUserInfoService.h"
#import "VKSBSwipableView.h"
#import "CustomView.h"

@interface VkSberProfileViewController ()

@property (nonatomic, weak) UIImageView *avatarImage;
@property (nonatomic, weak) UILabel *userNamelabel;
@property (nonatomic, weak) UILabel *graduateLabel;
@property (nonatomic, weak) UILabel *bdayLabel;
@property (nonatomic,strong) VkSberUserInfoService *service;
@property (strong, nonatomic)  VKSBSwipableView *exampleView;
@property (strong, nonatomic) CustomView *customView;
@property (nonatomic, strong) NSMutableArray *views;

@end

@implementation VkSberProfileViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.service = [VkSberUserInfoService new];
	[self.service getMyProfileInfo:^(NSDictionary *data) {
		
	} failureBlock:^(NSInteger code) {
		
	}];
}


-(void)setupUI
{
	
}
//
//- (void)viewDidLoad {
//	[super viewDidLoad];
//		self.exampleView = [VKSBSwipableView new];
//		self.exampleView.frame = CGRectMake(self.view.frame.size.width/2 - 40, self.view.frame.size.height/2 - 40, 80, 80);
//		[self.view addSubview:self.exampleView];
//	self.views = [NSMutableArray new];
//	for(int i = 0; i < 3; i++)
//	{
//		self.customView = [CustomView new];
//		self.customView.backgroundColor = UIColor.blueColor;
//		[self.views addObject:self.customView];
//	}
//	[self.exampleView registerNib:self.views];
//	self.exampleView.dataSource = self;
//	self.exampleView.delegate = self;
//}
//
//
//- (void)willSwiped:(SwipeDirection )direction atIndex:(NSInteger)index
//{
//
//}
//
//- (NSInteger)numbersOfViews
//{
//	return 10;
//}
//
//- (void)view:(UIView *)view atIndex:(NSInteger)index
//{
//
//}

@end
