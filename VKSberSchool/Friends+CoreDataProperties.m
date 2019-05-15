//
//  Friends+CoreDataProperties.m
//  VKSberSchool
//
//  Created by Александр on 13/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//
//

#import "Friends+CoreDataProperties.h"

@implementation Friends (CoreDataProperties)

+ (NSFetchRequest<Friends *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Friends"];
}

@dynamic userID;
@dynamic userName;
@dynamic photoURL;

@end
