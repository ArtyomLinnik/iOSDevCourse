//
//  ALDeveloper.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALPatient.h"

@interface ALDeveloper : NSObject <ALPatient>

@property (assign, nonatomic) float experience;
@property (strong, nonatomic) NSString* name;

- (void) work;


@end
