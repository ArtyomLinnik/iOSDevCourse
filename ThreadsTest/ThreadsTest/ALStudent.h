//
//  ALStudent.h
//  ThreadsTest
//
//  Created by Artyom Linnik on 10/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void (^ALStudentBlock)(NSString *str);

@interface ALStudent : NSObject

@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) NSInteger number;
@property (assign,nonatomic) NSInteger range;

+ (dispatch_queue_t)sharedInstance;

- (id)initWithName:(NSString *)name guessTheNumber:(NSInteger)number range:(NSInteger)range;
- (void)startTask;
- (void)startTaskWithBlock:(ALStudentBlock)block;

@end
