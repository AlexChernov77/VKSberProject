//
//  CustomView.m
//  VKSberSchool
//
//  Created by Александр on 02/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CustomView.h"
#import "UIImageView+AsyncDownload.h"


@interface CustomView ()

@property (nonatomic, strong)IBOutlet UIImageView *avatarImage;

@end

@implementation CustomView

-(void)configureSelf: (VkSberAlbumModel *) model
{
	[self.avatarImage loadImage:model.photoURL];
}

@end
