//
//  ALAnimal.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALAnimal.h"

@implementation ALAnimal

- (instancetype)initWithName:(NSString *) breed Index:(NSInteger)index {
    self = [super init];
    if (self) {
        self.breed = [NSString stringWithFormat:@"%@ #%ld", breed, index];
        self.height = arc4random_uniform(90) + 10;//180.f;
        self.weight = arc4random_uniform(40) + 10;//70.f;
    }
    return self;
}

- (void)move {
    NSLog(@"%@ is move", self);
}

@end
