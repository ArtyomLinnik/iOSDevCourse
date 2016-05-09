//
//  ALStudent.m
//  BlocksTest
//
//  Created by Artyom Linnik on 07/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALStudent.h"

@implementation ALStudent

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cough = arc4random() % 2;
        self.nausea = arc4random() % 2;
        self.chills = arc4random() % 2;
        
        self.countSymptoms = [[NSNumber numberWithBool:self.cough ] floatValue] +
                             [[NSNumber numberWithBool:self.chills] floatValue] +
                             [[NSNumber numberWithBool:self.nausea] floatValue];
        
        self.soreSpot = arc4random() % 3;
        
        switch (self.soreSpot) {
            case 0:
                NSLog(@"Student-patient complanes of headache.");
                break;
            case 1:
                NSLog(@"Student-patient complanes of pain in throat.");
                break;
            case 2:
                NSLog(@"Student-patient complanes of pain in abdomen.");
                break;
            default:
                NSLog(@"Student-patient has nothing hurts.");
                break;
        }
        
    }
    return self;
}

- (NSString*)description {
    NSString* describe = [NSString stringWithFormat:@"%@ %@: temperature = %f, cough = %d, nausea = %d, chills = %d, symptoms = %f, soreSpot = %d", _firstName, _surName, _temperature, _cough, _nausea, _chills, _countSymptoms, _soreSpot];
    return describe;
}

- (BOOL)fellsBad {
    BOOL iFeelBad;
    
    if (self.temperature >= 37.7f) {
        iFeelBad = YES;
        NSLog(@"Need a doctor");
    } else {
        iFeelBad = NO;
        NSLog(@"Don't need a doctor");
    }
    
    return iFeelBad;
}

@end
