//
//  VkSberAlbumModel.m
//  VKSberSchool
//
//  Created by Александр on 11/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberAlbumModel.h"

@implementation VkSberAlbumModel

- (instancetype)initWithURL: (NSString *)photoUrl

{
	if (self = [super init])
	{
		_photoURL = photoUrl;
	}
	return self;
}

@end
