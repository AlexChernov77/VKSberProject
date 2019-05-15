//
//  VkSberPhotoAlbumViewController.m
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberPhotoAlbumViewController.h"
#import "VKSBSwipableView.h"
#import "VkSberAlbumModel.h"
#import "CustomsView.h"


@interface VkSberPhotoAlbumViewController ()<SwipableViewsDataSource, SwipableViewsDelegate>

@property (strong, nonatomic)  VKSBSwipableView *swipeView;
@property (strong, nonatomic)  CustomsView *customView;
@property (strong, nonatomic) NSMutableArray *viewsArray;

@end


@implementation VkSberPhotoAlbumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupUI];
	[self.presenterOutput loadPhotos];
}

- (void)setupUI
{
	self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
	self.swipeView = [VKSBSwipableView new];
	self.swipeView.frame = CGRectMake(10, 10, CGRectGetWidth(self.view.frame) - 20, CGRectGetHeight(self.view.frame) - 20);
	self.viewsArray = [NSMutableArray new];
	for (int i = 0; i < 3; i++)
	{
		self.customView = [CustomsView new];
		[self.viewsArray addObject:self.customView];
	}
	[self.view addSubview:self.swipeView];
	[self.swipeView registerNib:self.viewsArray];
	self.swipeView.dataSource = self;
	self.swipeView.delegate = self;
}


#pragma mark - SwipableViewsDataSource, SwipableViewsDelegate


- (void)willSwiped:(SwipeDirection )direction atIndex:(NSInteger)index
{

}

- (NSInteger)numbersOfViews
{
	return [self.presenterOutput numberOfEntities];
}

- (void)view:(UIView *)view atIndex:(NSInteger)index
{
	VkSberAlbumModel *model = [self.presenterOutput entityAt:index];
	[(CustomsView*)view configureSelf: model];
}


#pragma mark - VkSberPhotoAlbumPresenterInputProtocol


- (void)reloadData
{
	[self.swipeView reloadData];
}

@end
