//
//  AppDelegate.h
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

