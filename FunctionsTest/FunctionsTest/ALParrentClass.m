//
//  ALParrentClass.m
//  FunctionsTest
//
//  Created by Artyom Linnik on 25/03/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALParrentClass.h"

@implementation ALParrentClass

+ (void) whoAreYou
{
    NSLog(@"I am ALParrentClass");
}

- (void) sayHello
{
    NSLog(@"Parrent says hello");
}

- (void) say:(NSString*) string
{
    NSLog(@"%@",string);
}

- (void) say:(NSString*) string1 and:(NSString*) string2
{
    NSLog(@"%@, %@", string1, string2);
}

- (NSString*) saySomeNumberString
{
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}

- (NSString*) saySomething
{
    NSString* string = [self saySomeNumberString];
    
    return string;
}

@end
