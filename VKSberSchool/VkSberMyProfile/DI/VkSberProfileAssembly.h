//
//  VkSberProfileAssembly.h
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VkSberProfileAssembly : NSObject

-(UITabBarController *)buildProfile : (NSString *)userID;

@end

NS_ASSUME_NONNULL_END
