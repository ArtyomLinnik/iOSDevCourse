//
//  ALDancer.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALDancer.h"

@implementation ALDancer

- (void) dance
{
    
}

#pragma mark - ALPatient

- (BOOL) areYouOK
{
    BOOL ok = arc4random() % 2;
    NSLog(@"Is dancer %@ ok? %@", self.name, ok ? @"YES": @"NO");
    
    return ok;
}
- (void) takePill
{
    NSLog(@"Dancer %@ takes a pill", self.name);
}
- (void) makeShot
{
    NSLog(@"Dancer %@ makes a shot", self.name);
}

@end
