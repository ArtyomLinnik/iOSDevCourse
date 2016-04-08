//
//  Object.m
//  ParametersTest
//
//  Created by Artyom Linnik on 01/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "Object.h"

@implementation Object

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Object is created");
    }
    return self;
}

-(id) copyWithZone:(NSZone *)zone
{
    Object* newObject = [[Object alloc] init];
    newObject.name = self.name;
    return newObject;
}

- (void) dealloc
{
    NSLog(@"Object is deallocated");
}

@end
