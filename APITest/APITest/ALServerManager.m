//
//  ALServerManager.m
//  APITest
//
//  Created by Artyom Linnik on 1/19/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALServerManager.h"
#import "AFNetworking.h"
#import "ALUser.h"
#import "ALUserLoginViewController.h"
#import "ALAccessToken.h"

@interface  ALServerManager()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@property (strong, nonatomic) ALAccessToken *accessToken;

@end


@implementation ALServerManager

+ (ALServerManager *)sharedManager {
	
	static ALServerManager *manager = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		manager = [ALServerManager new];
	});
	
	return manager;
}

-(instancetype)init
{
	self = [super init];
	
	if (self) {
		NSURL *url = [NSURL URLWithString:@"https://api.vk.com/method/"];
		
		self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
	}
	return self;
}

- (void)authorizeUser:(void(^)(ALUser *user))completion
{
	ALUserLoginViewController *vc = [[ALUserLoginViewController alloc] initWithCompilationBlock:^(ALAccessToken *token) {
		self.accessToken = token;
		
		if (token) {
			[self getUser:self.accessToken.userID
				onSuccess:^(ALUser *user) {
					if (completion) {
						completion(user);
					}
				} onFailure:^(NSError *error, NSInteger statusCode) {
					if (completion) {
						completion(nil);
					}
				}];
		} else if (completion) {
			completion(nil);
		}
	}];
	
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
	
	UIViewController *mainVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
	
	[mainVC presentViewController:nav
						 animated:YES
					   completion:nil];
}

- (void)getUser:(NSString *)userID
	  onSuccess:(void(^)(ALUser *user))success
	  onFailure:(void(^)(NSError *error, NSInteger statusCode))failure {
	
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							userID,        @"user_ids",
							@"photo_50",   @"fields",
							@"nom",        @"name_case", nil];
	
	[self.sessionManager
	 GET:@"users.get "
	 parameters:params progress:nil
	 success:^(NSURLSessionTask *task, NSDictionary *responseObject) {
		 NSLog(@"JSON: %@", responseObject);
		 
		 NSArray  *dictsArray = [responseObject objectForKey:@"response"];
		 
		 if (dictsArray.count > 0 ) {
			 ALUser *user = [[ALUser  alloc] initWithServerResponse:[dictsArray firstObject]];
			 if (success) {
				 success(user);
			 }
		 } else {
			 if (failure) {
				 (failure(nil, 0));
			 }
		 }
		 
	 } failure:^(NSURLSessionTask *task, NSError *error) {
		 NSLog(@"Error: %@", error);
		 if (failure) {
			 NSLog(@"Error: %@", error);
		 }
	 }];
	 
}

- (void)getFriendsWithOffset:(NSInteger)offset count:(NSInteger)count
				   onSuccess:(void(^)(NSArray *friends))success
				   onFailure:(void(^)(NSError *error, NSInteger statusCode))failure {
	
//	@"https://api.vk.com/method/friends.get";
	
	NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
							@"236306523",	@"user_id",
							@"name",		@"order",
							@ (count),		@"count",
							@(offset),		@"offset",
							@"photo_50",	@"fields",
							@"nom",			@" name_case", nil];
	
	[self.sessionManager
	 GET:@"friends.get"
	 parameters:params progress:nil
	 success:^(NSURLSessionTask *task, NSDictionary *responseObject) {
		NSLog(@"JSON: %@", responseObject);
		 
		 NSArray  *dictsArray = [responseObject objectForKey:@"response"];
		 
		 NSMutableArray *objectsArray =  [NSMutableArray array];
		 
		 for (NSDictionary *dict in dictsArray) {
			 ALUser *user = [[ALUser  alloc] initWithServerResponse:dict];
			 [objectsArray addObject:user];
		 }
		 
		 if (success) {
			 success(objectsArray);
		 }
		 
	} failure:^(NSURLSessionTask *operation, NSError *error) {
		NSLog(@"Error: %@", error);
		 
		
	}];
	
//	friends.get;
//	user_id 49644442;
//	order name;
//	count
//	offset
//	fields photo_50
//	name_case nom
	
	
}

@end
