//
//  VkSberFriendsTableViewCell.m
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberFriendsTableViewCell.h"
#import "VkSberUIImageView+AsyncDownload.h"

@interface VkSberFriendsTableViewCell()

@property (nonatomic, strong) UIImageView *avatarImage;
@property (nonatomic, strong) UILabel *userName;

@end

@implementation VkSberFriendsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self)
	{
		[self setupAvatarImage];
		[self setupUserNameLabel];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	return self;
}

- (void)prepareForReuse
{
	self.avatarImage.image = nil;
	self.userName.text = nil;
	[super prepareForReuse];
}

- (void)configureCell: (VkSberFriendsModel *)model
{
	[self.avatarImage loadImage:model.photoURL];
	self.userName.text = model.userName;
}


#pragma mark - Layout and Setup

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self layoutAvatarImage];
	[self layoutUserNameLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

- (void)layoutAvatarImage
{
	self.avatarImage.frame = CGRectMake(15, self.frame.size.height / 2 - 35, 70, 70);
}

- (void)layoutUserNameLabel
{
	self.userName.frame = CGRectMake(CGRectGetMaxX(self.avatarImage.frame) + 15, self.frame.size.height / 2 - 25, 400, 50);
}

- (void)setupAvatarImage
{
	self.avatarImage = [UIImageView new];
	self.avatarImage.layer.cornerRadius = 35;
	self.avatarImage.layer.masksToBounds = YES;
	[self.contentView addSubview:self.avatarImage];
}

- (void)setupUserNameLabel
{
	self.userName = [UILabel new];
	[self.contentView addSubview:self.userName];
}

@end
