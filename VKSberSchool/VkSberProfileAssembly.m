//
//  VkSberProfileAssembly.m
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberProfileAssembly.h"
#import "VkSberProfilePresenter.h"
#import "VkSberFriendsViewController.h"
#import "VkSberProfileViewController.h"

@implementation VkSberProfileAssembly

- (UITabBarController *)buildProfile : (NSString *)userID
{
	VkSberProfileViewController *profileCiewController = [[VkSberProfileViewController alloc] init];
	UINavigationController *navigationProfileController = [[UINavigationController alloc] initWithRootViewController:profileCiewController];
	
	VkSberProfilePresenter *presenter = [[VkSberProfilePresenter alloc] initWithUserId:userID];
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
	return tabBarViewController;
}

@end
