//
//  ALJumper.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALJumper.h"

@implementation ALJumper

- (instancetype)initWithName:(NSString *) name Index:(NSInteger)index {
    self = [super initWithName:name Index:index];
    if (self) {
        self.lastName = [NSString stringWithFormat:@"lstrnm %ld", index];
        self.heightOfTheJump = arc4random_uniform(40) + 10;
    }
    return self;
}

- (void)move {
    [super move];
    NSLog(@"%@ is jumps", self);
}

- (void)about {
    [super about];
    NSLog(@"Lastname = %@", self.lastName);
    NSLog(@"Max Jump = %ld", self.heightOfTheJump);
}

#pragma mark - OTJumpersProtocol

- (void)jump {
    NSLog(@"%@ is jumping %ld", self.name, self.heightOfTheJump);
}

@end
