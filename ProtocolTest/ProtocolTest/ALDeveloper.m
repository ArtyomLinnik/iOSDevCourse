//
//  ALDeveloper.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALDeveloper.h"

@implementation ALDeveloper

- (void) work
{
    
}

#pragma mark - ALPatient

- (BOOL) areYouOK
{
    BOOL ok = arc4random() % 2;
    NSLog(@"Is developer %@ ok? %@", self.name, ok ? @"YES": @"NO");
    
    return ok;
}
- (void) takePill
{
    NSLog(@"Developer %@ takes a pill", self.name);
}
- (void) makeShot
{
    NSLog(@"Developer %@ makes a shot", self.name);
}

- (NSString*) howIsYourJob
{
    return @"My job is awesome!";
}

@end
