//
//  ALStudent.h
//  KVCTest
//
//  Created by Artyom Linnik on 11/28/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALStudent : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

- (void)changeName;

@end
