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
#import "UIImageView+AsyncDownload.h"

@interface VkSberPhotoAlbumViewController ()<SwipableViewsDataSource, SwipableViewsDelegate>

@property (nonatomic, strong) UIImageView *avatarImage;
@property (strong, nonatomic)  VKSBSwipableView *exampleView;
@property (strong, nonatomic) CustomView *customView;

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
	self.exampleView = [VKSBSwipableView new];
	self.exampleView.frame = self.view.frame;
	
	[self.view addSubview:self.exampleView];
	UINib *nib = [UINib nibWithNibName:@"CustomView" bundle:nil];
	[self.exampleView registerNib:nib];
	self.exampleView.dataSource = self;
	self.exampleView.delegate = self;
}

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
- (void)reloadData
{
	[self.exampleView reloadData];
}

@end
