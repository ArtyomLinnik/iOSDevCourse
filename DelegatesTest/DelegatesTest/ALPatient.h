//
//  ALPaient.h
//  DelegatesTest
//
//  Created by Artyom Linnik on 07/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    ALHeadAche,
    ALHandPain,
    ALStomaсhPain,
    ALLegPain
    
} ALAche;

@protocol ALPatientDeligate;


@interface ALPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float temperature;
@property (weak, nonatomic) id <ALPatientDeligate> delegate;
@property (assign, nonatomic) short mark;


- (BOOL) howAreYou;
- (void) takePill;
- (void) makeShot;

@end

@protocol ALPatientDeligate
@required
- (void) patientFeelsBad:(ALPatient*) patient;
- (void) patient:(ALPatient*) patient hasQuestion:(NSString*) question;


@end