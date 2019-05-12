//
//  UIImageView+AsyncDownload.h
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AsyncDownload)

- (void)loadImage: (NSString *) urlString;

@end
