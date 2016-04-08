//
//  ALDancer.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALPatient.h"

@interface ALDancer : NSObject <ALPatient>

@property (strong, nonatomic) NSString* favouriteDance;
@property (strong, nonatomic) NSString* name;


- (void) dance;

@end
