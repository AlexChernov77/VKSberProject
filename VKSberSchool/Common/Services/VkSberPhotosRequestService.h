//
//  VkSberPhotosRequestService.h
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VkSberPhotosRequestService : NSObject

-(void)getMyAlbum: (void (^) (NSDictionary *data)) success
		  failureBlock : (void (^) (NSInteger code)) failure;

-(void)getFriendsPhoto: (NSString *) userID
	 successBlock : (void (^) (NSDictionary *data)) success
	 failureBlock : (void (^) (NSInteger code)) failure;


-(void)getPhotos: (void (^) (NSArray *urlArray)) completion;
@end

