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
    ALStomachPain,
    ALLegPain
    
} ALAche;

@protocol ALPatientDeligate;


@interface ALPatient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float temperature;
@property (weak, nonatomic) id <ALPatientDeligate> delegate;
@property (assign, nonatomic) BOOL mark;
@property (assign, nonatomic) float neusea;

- (void) goToDoctor;
- (BOOL) howAreYou;
- (void) takePill;
- (void) makeShot;
- (void) takeNeuseaPill;
- (void) putGypsum;
- (void) temperatureUp;
- (void) temperatureDown;


@end

@protocol ALPatientDeligate
@required
- (void) patientFeelsBad:(ALPatient*) patient withAche:(ALAche) ache;
- (void) patient:(ALPatient*) patient hasQuestion:(NSString*) question;


@end