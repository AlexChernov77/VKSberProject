//
//  VkSberProfileViewController.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberProfileViewController.h"
#import "VkSberCustomUILabel.h"
#import "VkSberProfileModel.h"
#import "VkSberEmptyLoadingView.h"
#import "VkSberUIImageView+AsyncDownload.h"
#import "VkSberPhotoAlbumViewController.h"

@interface VkSberProfileViewController ()

@property (nonatomic, strong) UIImageView *avatarImage;
@property (nonatomic, strong) UILabel *userNamelabel;
@property (nonatomic, strong) UILabel *graduateLabel;
@property (nonatomic, strong) UILabel *bdayLabel;
@property (nonatomic, strong) VkSberCustomUILabel *bdayTitleLabel;
@property (nonatomic, strong) VkSberCustomUILabel *graduateTitleLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) VkSberCustomUILabel *cityTitleLabel;
@property (nonatomic, strong) UIButton *albumButton;
@property (nonatomic, strong) VkSberEmptyLoadingView *loadingView;

@end

@implementation VkSberProfileViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setupUI];
}

- (void)setupUI
{
	[self setupNavigationBar];
	[self setupAvatarImage];
	[self setupAlbumButton];
	[self setupUserNameLabel];
	[self setupBdayLabel];
	[self setupCityLabel];
	[self setupGraduateLabel];
	[self setupLoadingView];
	[self gerUserRequest];
}


#pragma mark - Action


- (void)perfomToAlbum
{
	VkSberPhotoAlbumViewController *viewController = [self.presenterOutput perfomToPhoto];
	[self.navigationController pushViewController:viewController animated:NO];
}

#pragma mark - Setup


- (void)setupNavigationBar
{
	self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
	self.navigationItem.title = @"Profile";
	self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
																   [UIColor whiteColor], NSForegroundColorAttributeName, nil];
	self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
}

- (void)setupLoadingView
{
	self.loadingView = [[VkSberEmptyLoadingView alloc] initWithFrame:self.view.frame];
	
	[self.view addSubview:self.loadingView];
	[self.view bringSubviewToFront:self.loadingView];
	self.loadingView.hidden = YES;
}

- (void)setupAvatarImage
{
	NSInteger vertivcalMargin = [[UIScreen mainScreen]bounds].size.width <= 320 ? 94 : 104;
	
	self.avatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, vertivcalMargin, CGRectGetWidth(self.view.frame) - 40, CGRectGetHeight(self.view.frame) / 2.5)];
	self.avatarImage.layer.borderWidth = 2;
	self.avatarImage.contentMode = UIViewContentModeScaleAspectFill;
	self.avatarImage.layer.borderColor = UIColor.blackColor.CGColor;
	self.avatarImage.layer.cornerRadius = 10;
	self.avatarImage.clipsToBounds = YES;
	
	[self.view addSubview:self.avatarImage];
}

- (void)setupAlbumButton
{
	self.albumButton = [[UIButton alloc] initWithFrame:self.avatarImage.frame];
	[self.albumButton addTarget:self action:@selector(perfomToAlbum) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:self.albumButton];
}

- (void)setupUserNameLabel
{
	self.userNamelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.avatarImage.frame) + 30,
																   CGRectGetWidth(self.view.frame), 25)];
	self.userNamelabel.textColor = UIColor.whiteColor;
	self.userNamelabel.font = [UIFont boldSystemFontOfSize:22];
	[self.view addSubview:self.userNamelabel];
}

- (void)setupBdayLabel
{
	self.bdayTitleLabel = [[VkSberCustomUILabel alloc] init: CGRectMake(20, CGRectGetMaxY(self.userNamelabel.frame) + 20, 120, 15)
									 textColor: UIColor.lightGrayColor
										  font:[UIFont systemFontOfSize:15]
														   textLabel:@"Дата рождения:"];
	
	self.bdayLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.bdayTitleLabel.frame) + 10, CGRectGetMaxY(self.userNamelabel.frame) + 20, CGRectGetWidth(self.view.frame), 20)];
	self.bdayLabel.textColor = UIColor.whiteColor;
	self.bdayLabel.font = [UIFont boldSystemFontOfSize:15];
	
	[self.view addSubview:self.bdayTitleLabel];
	[self.view addSubview:self.bdayLabel];
}

- (void)setupCityLabel
{
	self.cityTitleLabel = [[VkSberCustomUILabel alloc] init: CGRectMake(20, CGRectGetMaxY(self.bdayTitleLabel.frame) + 20, 120, 15)
												  textColor: UIColor.lightGrayColor
													   font:[UIFont systemFontOfSize:15]
												  textLabel:@"Город:"];
	
	self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.cityTitleLabel.frame) + 10, CGRectGetMaxY(self.bdayTitleLabel.frame) + 20, CGRectGetWidth(self.view.frame), 20)];
	self.cityLabel.textColor = UIColor.whiteColor;
	self.cityLabel.font = [UIFont boldSystemFontOfSize:15];
	
	[self.view addSubview:self.cityTitleLabel];
	[self.view addSubview:self.cityLabel];
}

- (void)setupGraduateLabel
{
	self.graduateTitleLabel = [[VkSberCustomUILabel alloc] init: CGRectMake(20, CGRectGetMaxY(self.cityTitleLabel.frame) + 20, 120, 15)
												  textColor: UIColor.lightGrayColor
													   font:[UIFont systemFontOfSize:15]
												  textLabel:@"Образование:"];
	
	self.graduateLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.graduateTitleLabel.frame) + 10, CGRectGetMaxY(self.cityTitleLabel.frame) + 20, CGRectGetWidth(self.view.frame), 20)];
	self.graduateLabel.textColor = UIColor.whiteColor;
	self.graduateLabel.font = [UIFont boldSystemFontOfSize:15];
	
	[self.view addSubview:self.graduateTitleLabel];
	[self.view addSubview:self.graduateLabel];
}


#pragma mark - Request


- (void)gerUserRequest
{
	self.loadingView.hidden = NO;
	[self.presenterOutput loadUser:^(VkSberProfileModel *user) {
		[self updateUI:user];
		self.loadingView.hidden = YES;
	}];
	
}

- (void)updateUI: (VkSberProfileModel *) user
{
	self.userNamelabel.text = user.userName;
	self.cityLabel.text = user.city;
	self.bdayLabel.text = user.bDay;
	self.graduateLabel.text = user.education;
	[self.avatarImage loadImage:user.photoURL];
}

@end
