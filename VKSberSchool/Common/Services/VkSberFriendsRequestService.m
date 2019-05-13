//
//  VkSberFriendsRequestService.m
//  VKSberSchool
//
//  Created by Александр on 12/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberFriendsRequestService.h"
#import "NSUserDefaultsService.h"
#import "VkSberFriendsModel.h"
#import "AppDelegate.h"
#import "Friends+CoreDataClass.h"
#import "NetworkService.h"
#import "NetworkHelper.h"
#import "Constant.h"

@interface VkSberFriendsRequestService()

@property (strong, nonatomic) NSUserDefaultsService *userDefaultsService;
@property (strong, nonatomic) NetworkService *nerworkService;
@property (strong, nonatomic) NetworkHelper *nerworkHepler;
@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;
@property (nonatomic, strong) NSMutableArray <Friends *> *userInfoArray;
@property (nonatomic, strong) NSFetchRequest *fetchRequest;

@end

@implementation VkSberFriendsRequestService

- (instancetype) init
{
	if (self = [super init])
	{
		_userDefaultsService = [NSUserDefaultsService new];
		_nerworkService = [NetworkService new];
		_nerworkHepler = [NetworkHelper new];
	}
	return self;
}

- (void)getFriendsList: (void (^) (NSDictionary *data)) success
		  failureBlock : (void (^) (NSInteger code)) failure
{
	
	NSMutableDictionary *dictionary = [NSMutableDictionary new];
	
	[dictionary setObject:@"photo_100" forKey:VkSberFields];
	
	NSURLRequest *request = [self.nerworkHepler createGetRequest:VkSberBaseUrl vkMethod:VkSberFriendsGet withParametrs:dictionary];
	
	[self.nerworkService load:request successBlock:success failureBlock:failure];
}

- (void)getFriends: (void (^) (NSArray *urlArray)) completion
{
	[self getFriendsList:^(NSDictionary *data) {
		NSDictionary *user = data[@"response"];
		
		NSArray *array = user[@"items"];
		
		for (int i = 0; i <array.count; i++)
		{
			NSDictionary *friend = array[i];
			
			NSString *name = friend[@"first_name"];
			NSString *lastName = friend[@"last_name"];
			NSString *url_m = friend[@"photo_100"];
			NSString *userId = [friend[@"id"] stringValue];
			NSString *userName = [NSString stringWithFormat: @"%@ %@", name, lastName];
			
			Friends *friends = [NSEntityDescription insertNewObjectForEntityForName:@"Friends" inManagedObjectContext:self.coreDataContext];

			friends.userName = userName;
			friends.userID = userId;
			friends.photoURL = url_m;
			
			
			NSError *error = nil;
			
			if (![friends.managedObjectContext save:&error])
			{
				NSLog(@"Не удалось сохранить объект");
				NSLog(@"%@, %@", error, error.localizedDescription);
			}
		}
		self.userInfoArray = [self updatedArray].mutableCopy;
		completion(self.userInfoArray);
	} failureBlock:^(NSInteger code) {
		NSLog(@"Обработка ошибки");
	}];
}

- (NSManagedObjectContext *)coreDataContext
{
	UIApplication *application = [UIApplication sharedApplication];
	NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).
	persistentContainer;
	NSManagedObjectContext *context = container.viewContext;
	
	return context;
}

- (NSArray *)updatedArray;
{
	NSError *error = nil;
	
	NSArray *result = [self.coreDataContext executeFetchRequest:self.fetchRequest ? : [Friends fetchRequest] error:&error];
	return result;
}

- (NSFetchRequest *)fetchRequest
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Friends"];
	return fetchRequest;
}

@end
