//
//  ALMain.m
//  DictionaryTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALMain.h"
#import "ALStudent.h"

@implementation ALMain

- (void)main {
    //    [self levelNoob];
    //    [self levelStudent];
    [self levelMaster];
}

- (void)levelMaster {
    NSMutableArray *arrayOfStudents = [NSMutableArray array];
    NSMutableArray *arrayOfKeys = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        ALStudent *student = [[ALStudent alloc] init];
        [arrayOfStudents addObject:student];
        
        NSString *key = [NSString stringWithFormat:@"%@%@", student.name, student.lastName];
        [arrayOfKeys addObject:key];
    }
    
    NSDictionary *journal = [NSDictionary dictionaryWithObjects:arrayOfStudents forKeys:arrayOfKeys];
    
    NSArray *sortedArrayOfKeys = [arrayOfKeys sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSString *key in sortedArrayOfKeys) {
        id object = journal[key];
        if (![object isKindOfClass:[ALStudent class]]) {
            NSLog(@"WARNING!!! OBJECT IS NOT STUDENT CLASS");
        } else {
            ALStudent *student = (ALStudent *)object;
            [student greeting];
        }
    }
}

- (void)levelStudent {
    NSMutableArray *arrayOfStudents = [NSMutableArray array];
    NSMutableArray *arrayOfKeys = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        ALStudent *student = [[ALStudent alloc] init];
        [arrayOfStudents addObject:student];
        
        NSString *key = [NSString stringWithFormat:@"%@%@", student.name, student.lastName];
        [arrayOfKeys addObject:key];
    }
    
    NSDictionary *journal = [NSDictionary dictionaryWithObjects:arrayOfStudents forKeys:arrayOfKeys];
    
    for (NSString *key in [journal allKeys]) {
        id object = journal[key];
        if (![object isKindOfClass:[ALStudent class]]) {
            NSLog(@"WARNING!!! OBJECT IS NOT STUDENT CLASS");
        } else {
            ALStudent *student = (ALStudent *)object;
            [student greeting];
        }
    }
}

- (void)levelNoob {
    NSMutableArray *arrayOfStudents = [NSMutableArray array];
    NSMutableArray *arrayOfKeys = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        ALStudent *student = [[ALStudent alloc] init];
        [arrayOfStudents addObject:student];
        
        NSString *key = [NSString stringWithFormat:@"%@%@", student.name, student.lastName];
        [arrayOfKeys addObject:key];
    }
    NSDictionary *journal = [NSDictionary dictionaryWithObjects:arrayOfStudents forKeys:arrayOfKeys];
    NSLog(@"%@", journal);
}

@end
