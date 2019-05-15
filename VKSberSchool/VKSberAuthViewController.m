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
#import "VkSberProfileAssembly.h"
#import "Constant.h"


@interface VKSberAuthViewController ()<WKNavigationDelegate>

@property (strong, nonatomic) VkAuthService *service;
@property (strong, nonatomic) WKWebView *authWebView;
@property (strong, nonatomic) NSUserDefaultsService *userDufaultService;
@property (strong, nonatomic) VkSberProfileAssembly *build;

@end


@implementation VKSberAuthViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.userDufaultService = [NSUserDefaultsService new];
	self.service = [VkAuthService new];
	self.build = [VkSberProfileAssembly new];
	self.authWebView = [[WKWebView alloc] initWithFrame:self.view.frame];
	[self.view addSubview:self.authWebView];
	self.authWebView.navigationDelegate = self;
	[self.authWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:VkSberAuthURL]]];
	[self.view.window makeKeyAndVisible];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
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


- (void)performToProfile: (NSString *) token
{
	[self.service authorization:^{
		UITabBarController *tabBarViewController = [self.build buildProfile:@""];
		[self presentViewController:tabBarViewController animated:NO completion: nil];
	} failureBlock:^{
	} authToken:token];
}

@end
