//
//  ALServerManager.m
//  APITest
//
//  Created by Artyom Linnik on 1/19/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALServerManager.h"
#import "Libs/AFNetworking.h"


@implementation ALServerManager

+ (ALServerManager *)sharedManager {
	
	static ALServerManager *manager = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		manager = [ALServerManager new];
	});
	
	return manager;
}

- (void)getFriendsWithOffset:(NSInteger)offset count:(NSInteger)count
				   onSuccess:(void(^)(NSArray *friends))success
				   onFailure:(void(^)(NSError *error, NSInteger statusCode))failure {
	
//	@"https://api.vk.com/method/friends.get";
	

	
//	friends.get;
//	user_id 49644442;
//	order name;
//	count
//	offset
//	fields photo_50
//	name_case nom
	
	
}

@end
