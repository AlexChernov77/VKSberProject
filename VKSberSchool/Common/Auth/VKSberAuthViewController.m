//
//  VKSberAuthViewController.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VKSberAuthViewController.h"
#import "VkAuthService.h"
#import "NSUserDefaultsService.h"
#import "VkSberProfileViewController.h"
#import "VkSberFriendsViewController.h"
#import "NSUserDefaultsService.h"
#import "VkSberProfilePresenter.h"
#import "Constant.h"

@interface VKSberAuthViewController ()<WKNavigationDelegate>

@property (strong, nonatomic) VkAuthService *service;
@property (strong, nonatomic) WKWebView *authWebView;
@property (strong, nonatomic) NSUserDefaultsService *userDufaultService;

@end

@implementation VKSberAuthViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.userDufaultService = [NSUserDefaultsService new];
	self.service = [VkAuthService new];
	self.authWebView = [[WKWebView alloc] initWithFrame:self.view.frame];
	[self.view addSubview:self.authWebView];
	self.authWebView.navigationDelegate = self;
	[self.authWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:VkSberAuthURL]]];
	[self.view.window makeKeyAndVisible];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
	
	NSString *accessToken = [self.service stringBetweenString:@"access_token="
													andString:@"&"
												  innerString:[[self.authWebView URL] absoluteString]];
	if (accessToken != nil)
	{
		[self.authWebView removeFromSuperview];
		[self.userDufaultService saveAccessToken:accessToken];
		[self performToProfile:accessToken];
	}
	
}


-(void)performToProfile: (NSString *) token
{
	[self.service authorization:^{
		VkSberProfileViewController *profileCiewController = [[VkSberProfileViewController alloc] init];
		UINavigationController *navigationProfileController = [[UINavigationController alloc] initWithRootViewController:profileCiewController];
		
		VkSberProfilePresenter *presenter = [[VkSberProfilePresenter alloc] initWithUserId:@""];
		profileCiewController.presenterOutput = presenter;
		
		VkSberFriendsViewController *friendsviewController = [[VkSberFriendsViewController alloc] init];
		UINavigationController *navigationFriendsController = [[UINavigationController alloc] initWithRootViewController:friendsviewController];
		
		navigationProfileController.tabBarItem.title = @"Профиль";
		navigationProfileController.tabBarItem.image = [UIImage imageNamed:@"profile"];
		
		navigationFriendsController.tabBarItem.title = @"Друзья";
		navigationFriendsController.tabBarItem.image = [UIImage imageNamed:@"friends"];
		
		NSArray *viewControllerArray = @[navigationProfileController, navigationFriendsController];
		UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
		tabBarViewController.tabBar.translucent = YES;
		tabBarViewController.tabBar.tintColor = [UIColor whiteColor];
		tabBarViewController.tabBar.barTintColor = [UIColor blackColor];
		
		tabBarViewController.viewControllers = viewControllerArray;
		[self presentViewController:tabBarViewController animated:NO completion: nil];
	} failureBlock:^{
		
	} authToken:token];
	
}

@end
