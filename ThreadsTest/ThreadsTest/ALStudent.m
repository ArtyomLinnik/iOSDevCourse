//
//  ALStudent.m
//  ThreadsTest
//
//  Created by Artyom Linnik on 10/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALStudent.h"

#define THREAD_COUNT 10

@interface ALStudent ()

@property (strong,nonatomic) NSMutableArray *threadArray;

@end

@implementation ALStudent

+ (dispatch_queue_t)sharedInstance {
    
    static dispatch_once_t task;
    static dispatch_queue_t queue;
    dispatch_once(&task, ^{
        queue = dispatch_queue_create("art.multithreading", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return queue;
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
    
    long rangeThread = self.range / THREAD_COUNT;
    
    int startPoint = 0;
    
    long endPoint = rangeThread;
    
    self.threadArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < THREAD_COUNT; i++) {
        
        NSRange threadRange = {startPoint,endPoint};
        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(guessTheNumberThread:) object:[NSValue valueWithRange:threadRange]];
        thread.name = [NSString stringWithFormat:@"%@ %d",self.name, i];
        @synchronized (self) {
            [self.threadArray addObject:thread];
        }
        [thread start];
        startPoint = startPoint + rangeThread;
        endPoint = endPoint + rangeThread;
    }
    
}

- (void)guessTheNumberThread:(NSValue *)threadObj {
    
    NSRange range = [threadObj rangeValue];
    NSMutableArray *temp = self.threadArray;
    for (int i = range.location; i < range.length; i++) {
        if (i == self.number) {
            NSLog(@"%@ found number, number equals %d",self.name, i);
            
            @synchronized (self) {
                for (NSThread *thread in temp) {
                    [thread cancel];
                    NSLog(@"%@ is cancel",thread.name);
                }
                
            }
        }
    }
}

- (void)startTaskWithBlock:(ALStudentBlock)block {
    
    
    int rangeThread = self.range / THREAD_COUNT;
    
    int startPoint = 0;
    
    int endPoint = rangeThread;
    
    for (int i = 0; i < THREAD_COUNT; i++) {
        
        NSRange threadRange = {startPoint,endPoint};
        
        dispatch_async([ALStudent sharedInstance], ^{
            for (int i = threadRange.location; i < threadRange.length; i++) {
                if (i == self.number) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        block([NSString stringWithFormat:@"%@ found number, number equals %d",self.name, i]);
                    });
                }
            }
            
        });
        startPoint = startPoint + rangeThread;
        endPoint = endPoint + rangeThread;
    }
    
    
}

@end
