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
@property (strong, nonatomic) NSString *photoURL;
@property (strong, nonatomic) NSString *education;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *bDay;

/**
 Инициализирует модель
 @param name - имя
 @param bday - др
 @param city - город
 @param education - образование
 @param photoUrl - ссылка на аватарку
 @return action
 */

-(instancetype)initWithUserName: (NSString *)name
					   birthday: (NSString *)bday
						   city: (NSString *)city
					 educations: (NSString *)education
							url: (NSString *)photoUrl;


@end

