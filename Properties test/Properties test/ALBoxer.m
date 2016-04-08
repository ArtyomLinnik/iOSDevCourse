//
//  ALBoxer.m
//  Properties test
//
//  Created by Artyom Linnik on 30/03/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALBoxer.h"

@interface ALBoxer()
@property (assign, nonatomic) NSInteger nameCount;
@end

@implementation ALBoxer


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameCount = 0;
    }
    return self;
}

/*
- (void) setName:(NSString *)name
{
    NSLog(@"setter setName: is called");
    _name = name;
}
*/

- (NSString*) name
{
    self.nameCount = self.nameCount + 1;
    NSLog(@"name getter is called times %d", self.nameCount);
    return _name;
}

- (NSInteger) age
{
    NSLog(@"getter age is called");
    return _age;
}



- (NSInteger) howOldAreYou
{
    return self.age;
}

@end
