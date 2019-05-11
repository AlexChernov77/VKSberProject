//
//  VkSberProfileModel.h
//  VKSberSchool
//
//  Created by Александр on 10/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VkSberProfileModel : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *photoURL;
@property (strong, nonatomic) NSString *education;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *bDay;

-(instancetype)initWithUserName: (NSString *)name
					   birthday: (NSString *)bday
						   city: (NSString *)city
					 educations: (NSString *) education
							url: (NSURL *)photoUrl;


@end

