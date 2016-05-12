//
//  ALStudentSuperman.h
//  ThreadsTest
//
//  Created by Artyom Linnik on 12/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALStudentSuperman : NSObject

@property (strong,nonatomic) NSString *name;
@property (assign,nonatomic) NSInteger number;
@property (assign,nonatomic) NSInteger range;

+ (NSOperationQueue *)sharedInstance;

- (id)initWithName:(NSString *)name guessTheNumber:(NSInteger)number range:(NSInteger)range;
- (void)startTask;

@end
