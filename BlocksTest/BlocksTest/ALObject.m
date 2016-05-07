//
//  ALObject.m
//  BlocksTest
//
//  Created by Artyom Linnik on 07/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALObject.h"

@interface ALObject ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end

@implementation ALObject

- (id)init
{
    self = [super init];
    if (self) {
        
        __weak ALObject* weakSelf = self;
        
        self.objectBlock = ^{
            NSLog(@"%@", weakSelf.name);
        };
    }
    return self;
}


- (void) testMethod:(ObjectBlock) block {
    block();
}

- (void) dealloc {
    NSLog(@"ASObject is deallocated");
}


@end
