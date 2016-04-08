//
//  ALStudent.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALStudent.h"

@implementation ALStudent

- (void) study
{
    
}

#pragma mark - ALPatient

- (BOOL) areYouOK
{
    BOOL ok = arc4random() % 2;
    NSLog(@"Is stident %@ ok? %@", self.name, ok ? @"YES": @"NO");
    
    return ok;
}
- (void) takePill
{
    NSLog(@"Stident %@ takes a pill", self.name);
}
- (void) makeShot
{
    NSLog(@"Stident %@ makes a shot", self.name);
}

- (NSString*) howIsYourFamily
{
    return @"My family is doing well!";
}

@end
