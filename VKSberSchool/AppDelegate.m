//
//  AppDelegate.m
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "AppDelegate.h"
#import "VkAuthService.h"
#import "VKSberAuthViewController.h"
#import <SafariServices/SafariServices.h>
#import "VkSberCoreDataService.h"

@interface AppDelegate ()

@property (nonatomic,strong) VkSberCoreDataService *coreDataService;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
	VKSberAuthViewController *rootViewController = [VKSberAuthViewController new];
	
	self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	
	self.window.rootViewController = rootViewController;
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application
{
	self.coreDataService = [VkSberCoreDataService new];
    [self.coreDataService saveContext];
}

@end
