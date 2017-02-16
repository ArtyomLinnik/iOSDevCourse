//
//  ALServerManager.h
//  APITest
//
//  Created by Artyom Linnik on 1/19/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALUser;

@interface ALServerManager : NSObject

@property (strong, nonatomic) ALUser *user;

+ (ALServerManager *)sharedManager;

- (void)authorizeUser:(void(^)(ALUser *user))completion;

- (void)getFriendsWithOffset:(NSInteger)offset
					   count:(NSInteger)count
				   onSuccess:(void(^)(NSArray *friends))success
				   onFailure:(void(^)(NSError *error, NSInteger statusCode))failure;


- (void)getUser:(NSString *)userID
	  onSuccess:(void(^)(ALUser *user))success
	  onFailure:(void(^)(NSError *error, NSInteger statusCode))failure;

- (void)getGroupWall:(NSString *)groupID
		  withOffset:(NSInteger)offset
			   count:(NSInteger)count
		   onSuccess:(void(^)(NSArray *posts))success
 		   onFailure:(void(^)(NSError *error, NSInteger statusCode))failure;

- (void)postText:(NSString *)text
	 onGroupWall:(NSString *)groupID
	   onSuccess:(void(^)(id result))success
	   onFailure:(void(^)(NSError *error, NSInteger statusCode))failure;


@end
