//
//  ALPerson.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALPerson.h"

@implementation ALPerson


- (instancetype)initWithName:(NSString *) name Index:(NSInteger)index {
    self = [super init];
    if (self) {
        self.name = [NSString stringWithFormat:@"%@ #%ld",name, index];
        self.height = arc4random_uniform(100) + 90;//180.f;
        self.weight = arc4random_uniform(40) + 30;//70.f;
        self.gender = arc4random_uniform(100000) % 2;
    }
    return self;
}

- (void)move {
    NSLog(@"%@ is move", self);
}

- (void)genderCall {
    switch (self.gender) {
        case GenderMale:
            NSLog(@"Gender = Male");
            break;
            
        case GenderFemale:
            NSLog(@"Gender = Female");
            break;
            
        default:
            NSLog(@"WARNING!");
            break;
    }
}

- (void)about {
    NSLog(@"Name = %@", self.name);
    NSLog(@"Height = %1.2f", self.height);
    NSLog(@"Weight = %1.2f", self.weight);
    [self genderCall];
}

@end
