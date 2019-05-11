//
//  VkSberCustomUILabel.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberCustomUILabel.h"

@implementation VkSberCustomUILabel

-(instancetype)init: (CGRect) frame textColor: (UIColor *) color
													font: (UIFont *) textFont
											   textLabel: (NSString *) text
{
	if (self = [super init])
	{
		self.frame = frame;
		NSDictionary *txtDict = [NSDictionary dictionaryWithObjectsAndKeys:
								 textFont, NSFontAttributeName, color, NSForegroundColorAttributeName, nil];
		NSAttributedString *attrStr = [[NSAttributedString alloc]
									   initWithString:text attributes:txtDict];
		[self setAttributedText:attrStr];
	}
	return self;
}

@end
