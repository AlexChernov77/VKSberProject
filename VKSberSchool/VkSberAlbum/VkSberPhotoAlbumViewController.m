//
//  VkSberPhotoAlbumViewController.m
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberPhotoAlbumViewController.h"
#import "VkSberPhotosRequestService.h"
#import "VkSberUserInfoService.h"
#import "VKSBSwipableView.h"
#import "CustomView.h"
#import "VkSberAlbumModel.h"
#import "UIImageView+AsyncDownload.h"

@interface VkSberPhotoAlbumViewController ()<SwipableViewsDataSource, SwipableViewsDelegate>

@property (nonatomic, strong) UIImageView *avatarImage;
@property (nonatomic,strong) VkSberPhotosRequestService *service;
@property (strong, nonatomic)  VKSBSwipableView *exampleView;
@property (strong, nonatomic) CustomView *customView;
@property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic,copy) NSArray *array;

@end

@implementation VkSberPhotoAlbumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
	self.exampleView = [VKSBSwipableView new];
	self.exampleView.frame = self.view.frame;
	[self.view addSubview:self.exampleView];
	self.views = [NSMutableArray new];
	for(int i = 0; i < 3; i++)
	{
		self.customView = [CustomView new];
		[self.views addObject:self.customView];
	}
	UINib *nib = [UINib nibWithNibName:@"CustomView" bundle:nil];
	[self.exampleView registerNib:nib];
	self.exampleView.dataSource = self;
	self.exampleView.delegate = self;
	self.service = [VkSberPhotosRequestService new];
	[self.service getPhotos:^(NSArray *urlArray) {
		self.array = urlArray;
		[self.exampleView reloadData];
	}];
}

- (void)willSwiped:(SwipeDirection )direction atIndex:(NSInteger)index
{

}

- (NSInteger)numbersOfViews
{
	return self.array.count;
}

- (void)view:(UIView *)view atIndex:(NSInteger)index
{
	VkSberAlbumModel *model = self.array[index];
	[(CustomView*)view configureSelf: model];
}
@end
