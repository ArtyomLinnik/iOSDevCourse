//
//  ALBadDoctor.m
//  DelegatesTest
//
//  Created by Artyom Linnik on 11/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALBadDoctor.h"

@implementation ALBadDoctor

#pragma mark - ALPatientDeligate

- (void) patientFeelsBad:(ALPatient *)patient withAche:(ALAche)ache
{
    patient.mark = NO;
    NSLog(@"");
    NSLog(@"Patietn %@ feels bad, but I don't care", patient.name);
    
    if (patient.neusea < 3) {
        [patient takeNeuseaPill];
    } else {
        if (patient.temperature >= 38.5) {
            [patient temperatureUp];
        } else [patient temperature];
    }
}

- (void) patient:(ALPatient *)patient hasQuestion:(NSString *)question
{
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
