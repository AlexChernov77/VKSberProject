//
//  VkSberPhotosRequestService.h
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VkSberPhotosRequestService : NSObject

-(instancetype) initWithUserID: (NSString *) userID;

-(void)getPhotos: (void (^) (NSArray *urlArray)) completion;
@end

