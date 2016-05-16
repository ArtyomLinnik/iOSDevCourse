//
//  ALStudent.m
//  DictionaryTest
//
//  Created by Artyom Linnik on 06/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALStudent.h"
#import "Data.h"

@implementation ALStudent

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = firstNames[arc4random_uniform(51)];
        self.lastName = lastNames[arc4random_uniform(51)];
    }
    return self;
}

- (void)greeting {
    NSLog(@"The student %@ %@ says 'Hello!'", self.name, self.lastName);
}

@end
