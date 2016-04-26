//
//  ALPaient.m
//  DelegatesTest
//
//  Created by Artyom Linnik on 07/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALPatient.h"


@implementation ALPatient

- (void) goToDoctor
{
    [self.delegate patientFeelsBad:self withAche:arc4random() % 4];
}

- (BOOL) howAreYou
{
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        [self.delegate patientFeelsBad:self withAche:arc4random() % 4];
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

- (void) putGypsum
{
    NSLog(@"%@ put gypsum", self.name);
}

- (void) takeNeuseaPill
{
    NSLog(@"%@ takes neusea pill", self.name);
}

- (void) temperatureUp
{
    NSLog(@"temperature >= 38,5, %@ should makes shot", self.name);
}

- (void) temperatureDown
{
    NSLog(@"temperature < 38,5, %@ should rest", self.name);
}



@end


