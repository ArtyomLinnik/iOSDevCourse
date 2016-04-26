//
//  ALDoctor.m
//  NotificationsTest
//
//  Created by Artyom Linnik on 19/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALDoctor.h"
#import "ALGovernment.h"

@implementation ALDoctor

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:ALGovernmentSalaryDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:ALGovernmentAveragePriceUserInfoKey
                 object:nil];
    }
    return self;
}

- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark - Notifications

- (void) salaryChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:ALGovernmentSalaryUserInfoKey];
    
    float salary = [value floatValue];
    
    if (salary < self.salary) {
        NSLog(@"Doctors are NOT happy");
    } else {
        NSLog(@"Doctors are happy");
    }
    
    self.salary = salary;
}

- (void) averagePriceChangedNotification:(NSNotification*) notification {
    
}


@end
