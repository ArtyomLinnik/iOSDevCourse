//
//  ALPaient.m
//  DelegatesTest
//
//  Created by Artyom Linnik on 07/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALPatient.h"

@implementation ALPatient

- (BOOL) howAreYou
{
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self];
    }
    
    return iFeelGood;
}
- (void) takePill
{
    NSLog(@"%@ takes pill", self.name);
}
- (void) makeShot
{
    NSLog(@"%@ makes shot", self.name);
}

@end


