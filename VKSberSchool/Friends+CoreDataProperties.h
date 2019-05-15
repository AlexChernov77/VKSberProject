//
//  Friends+CoreDataProperties.h
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//
//

#import "Friends+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Friends (CoreDataProperties)

+ (NSFetchRequest<Friends *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userID;
@property (nullable, nonatomic, copy) NSString *userName;
@property (nullable, nonatomic, copy) NSString *photoURL;

@end

NS_ASSUME_NONNULL_END
