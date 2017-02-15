//
//  ALAccessToken.h
//  APITest
//
//  Created by Artyom Linnik on 2/14/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALAccessToken : NSObject

@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSDate *expirationDate;
@property (strong, nonatomic) NSString *userID;

@end 
