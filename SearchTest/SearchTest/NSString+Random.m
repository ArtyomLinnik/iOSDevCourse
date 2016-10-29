//
//  NSString+Random.m
//  SearchTest
//
//  Created by Artyom Linnik on 10/08/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)randomAlphanumericString
{
    int length = arc4random() % 11 + 5;
    return [self randomAlphanumericStringWithLenght:length];
}

+ (NSString *)randomAlphanumericStringWithLenght:(NSInteger)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyz"; //ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:length];
    
    for (int i = 0; i < length; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    
    return randomString;
}

@end
