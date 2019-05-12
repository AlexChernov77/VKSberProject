//
//  VkSberPhotoAlbumViewController.m
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberPhotoAlbumViewController.h"
#import "VKSBSwipableView.h"
#import "CustomView.h"
#import "VkSberAlbumModel.h"


@interface VkSberPhotoAlbumViewController ()<SwipableViewsDataSource, SwipableViewsDelegate>

@property (strong, nonatomic)  VKSBSwipableView *swipeView;

@end


@implementation VkSberPhotoAlbumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupUI];
	[self.presenterOutput loadPhotos];
}

-(void)setupUI
{
	self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
	self.swipeView = [VKSBSwipableView new];
	self.swipeView.frame = self.view.frame;
	
	[self.view addSubview:self.swipeView];
	UINib *nib = [UINib nibWithNibName:@"CustomView" bundle:nil];
	[self.swipeView registerNib:nib];
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
	[(CustomView*)view configureSelf: model];
}


#pragma mark - VkSberPhotoAlbumPresenterInputProtocol


- (void)reloadData
{
	[self.swipeView reloadData];
}

@end
