//
//  ALDoctor.h
//  DelegatesTest
//
//  Created by Artyom Linnik on 07/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALPatient.h"

@interface ALDoctor : NSObject <ALPatientDeligate>

@end