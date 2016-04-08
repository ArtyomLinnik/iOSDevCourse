//
//  ALDoctor.m
//  DelegatesTest
//
//  Created by Artyom Linnik on 07/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALDoctor.h"

@implementation ALDoctor





#pragma mark - ALPatientDelegate

- (void) patientFeelsBad:(ALPatient*) patient
{
    NSLog(@"Patient %@ feels bad", patient.name);
    
    if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
        [patient takePill];
    } else if (patient.temperature >= 40.f) {
        [patient makeShot];
    } else {
        NSLog(@"Patient %@ should rest", patient.name);
    }
    
}

- (void) patient:(ALPatient*) patient hasQuestion:(NSString*) question
{
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
