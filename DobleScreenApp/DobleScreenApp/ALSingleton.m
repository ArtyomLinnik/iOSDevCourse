//
//  ALSingleton.m
//  DobleScreenApp
//
//  Created by Artyom Linnik on 26/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALSingleton.h"

@implementation ALSingleton

+ (ALSingleton *) sharedInstance
{
    static ALSingleton *sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ALSingleton alloc] init];
    });
    return sharedInstance;
}

- (void)setStringMeth:(NSString *)string
{
    @synchronized(self) {
        currentString = string;
        }
}

- (NSString *)currentString
{
    @synchronized(self) {
        return currentString;
    }
}


@end
