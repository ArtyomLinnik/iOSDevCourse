//
//  ALPatient.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALPatient <NSObject>

@required
@property (strong, nonatomic) NSString* name;
- (BOOL) areYouOK;
- (void) takePill;
- (void) makeShot;

@optional
- (NSString*) howIsYourFamily;
- (NSString*) howIsYourJob;

@end
