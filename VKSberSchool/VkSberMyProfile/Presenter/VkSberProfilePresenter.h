//
//  VkSberProfilePresenter.h
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VkSberProfilePresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VkSberProfilePresenter : NSObject<VkSberProfilePresenterProtocol>

-(instancetype)initWithUserId: (NSString *)userID;

@end

NS_ASSUME_NONNULL_END
