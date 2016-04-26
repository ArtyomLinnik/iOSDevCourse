//
//  ALStudent.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALPatient.h"

@interface ALStudent : NSObject <ALPatient>

@property (strong, nonatomic) NSString* universityName;
@property (strong, nonatomic) NSString* name;



- (void) study;

@end
