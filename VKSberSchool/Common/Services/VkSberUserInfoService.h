//
//  VkSberUserInfoService.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VkSberUserInfoService : NSObject

-(void)getMyProfileInfo: (void (^) (NSDictionary *data)) success
		  failureBlock : (void (^) (NSInteger code)) failure;

-(void)getUserInfo: (NSString *) userID
	 successBlock : (void (^) (NSDictionary *data)) success
	 failureBlock : (void (^) (NSInteger code)) failure;

@end
