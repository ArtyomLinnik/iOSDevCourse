//
//  ALStudentSuperman.m
//  ThreadsTest
//
//  Created by Artyom Linnik on 12/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALStudentSuperman.h"

#define THREAD_COUNT 10

@interface ALStudentSuperman()

@end

@implementation ALStudentSuperman

+ (NSOperationQueue*) sharedInstance {
    static dispatch_once_t task;
    static NSOperationQueue *operationQueue = nil;
    dispatch_once(&task, ^{
        operationQueue = [[NSOperationQueue alloc]init];
    });
    
    return operationQueue;
}

- (id)initWithName:(NSString *)name guessTheNumber:(NSInteger)number range:(NSInteger)range {
    
    if (self = [super init]) {
        _name = name;
        _number = number;
        _range = range;
        
    }
    return self;
}

- (void)startTask {
    
    int rangeThread = self.range / THREAD_COUNT;
    
    int startPoint = 0;
    
    int endPoint = rangeThread;
    
    for (int i = 0; i < THREAD_COUNT; i++) {
        
        NSRange threadRange = {startPoint,endPoint};
        
        NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(operation:) object:[NSValue valueWithRange:threadRange]];
        [[ALStudentSuperman sharedInstance]addOperation:operation];
        startPoint = startPoint + rangeThread;
        endPoint = endPoint + rangeThread;
    }
    
}

- (void)operation:(NSValue *)threadObj {
    
    NSRange range = [threadObj rangeValue];
    for (int i = range.location; i < range.length; i++) {
        if (i == self.number) {
            NSLog(@"%@ found number, number equals %d",self.name, i);
            
        }
    }
}

@end
