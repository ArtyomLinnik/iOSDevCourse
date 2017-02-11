//
//  ALServerManager.h
//  APITest
//
//  Created by Artyom Linnik on 1/19/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALServerManager : NSObject

+ (ALServerManager *)sharedManager;

- (void)getFriendsWithOffset:(NSInteger)offset count:(NSInteger)count
				   onSuccess:(void(^)(NSArray *friends))success
				   onFailure:(void(^)(NSError *error, NSInteger statusCode))failure;

@end
