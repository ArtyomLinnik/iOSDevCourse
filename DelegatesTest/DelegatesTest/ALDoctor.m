//
//  ALDoctor.m
//  DelegatesTest
//
//  Created by Artyom Linnik on 07/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALDoctor.h"

@implementation ALDoctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.countHead=0;
        self.countHand=0;
        self.countLeg=0;
        self.countStomach=0;
    }
    return self;
}

- (void) report
{
    NSLog(@"There are %ld people came with head ache", self.countHead);
    NSLog(@"There are %ld people came with hand pain", self.countHand);
    NSLog(@"There are %ld people came with leg pain", self.countLeg);
    NSLog(@"There are %ld people came with stomach pain", self.countStomach);
}



#pragma mark - ALPatientDelegate

- (void) patientFeelsBad:(ALPatient*) patient withAche:(ALAche)ache
{
    NSLog(@"Patient %@ feels bad", patient.name);
    
    if (ache == ALHeadAche) {
        self.countHead++;
        if (patient.temperature >= 37.f && patient.temperature <= 39.f) {
            [patient takePill];
        } else if (patient.temperature >= 40.f) {
            [patient makeShot];
        } else {
            NSLog(@"Patient %@ should rest", patient.name);
        }
    } else if (ache == ALStomachPain)
    {
        self.countStomach++;
        if (patient.neusea < 4) NSLog(@"Drink lots of water");
            else NSLog(@"patient %@ should rest", patient.name);
        
    } else if (ache == ALHandPain)
    {
        self.countHand++;
        [patient putGypsum];
    } else if (ache == ALLegPain)
    {
        self.countLeg++;
        [patient putGypsum];
    }
}

- (void) patient:(ALPatient*) patient hasQuestion:(NSString*) question
{
    NSLog(@"Patient %@ has a question: %@", patient.name, question);
}

@end
