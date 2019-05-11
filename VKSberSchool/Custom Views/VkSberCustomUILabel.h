//
//  VkSberCustomUILabel.h
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface VkSberCustomUILabel : UILabel

-(instancetype)init: (CGRect) frame textColor: (UIColor *) color
						font: (UIFont *) textFont
				   textLabel: (NSString *) text;

@end

