//
//  CustomsView.m
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "CustomsView.h"
#import "VkSberUIImageView+AsyncDownload.h"


@interface CustomsView ()

@property (nonatomic, strong) UIImageView *avatarImage;

@end


@implementation CustomsView

- (instancetype)init
{
	self = [super init];
	if (self) {
		_avatarImage = [UIImageView new];
		_avatarImage.contentMode = UIViewContentModeScaleAspectFill;
		_avatarImage.clipsToBounds = YES;
		[self addSubview:_avatarImage];
	}
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self layoutAvatarImage];
}

- (void)layoutAvatarImage
{
	self.avatarImage.frame = self.frame;
}

- (void)configureSelf:(VkSberAlbumModel *)model
{
	[self.avatarImage loadImage:model.photoURL];
}

@end
