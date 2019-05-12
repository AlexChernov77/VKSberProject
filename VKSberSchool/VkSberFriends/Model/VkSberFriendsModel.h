//
//  VkSberFriendsModel.h
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VkSberFriendsModel : NSObject

@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *userName;

-(instancetype)initWithUserName: (NSString *)userName
						 userID: (NSString *)userID
							url: (NSString *)photoUrl;

@end

