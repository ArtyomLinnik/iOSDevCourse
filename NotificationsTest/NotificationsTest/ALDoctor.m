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
                   name:ALGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(ALDoctorDidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(ALDoctorWillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
    }
    return self;
}

- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) salaryChangedNotification: (NSNotification*) notification {
    
    float salary = [notification.userInfo[ALGovernmentSalaryUserInfoKey] floatValue];
    
    float salaryVariationPercent = (self.salary == 0) ? 0 : (salary/self.salary-1)*100;
    
    float incomeChangesPercent = salaryVariationPercent - self.inflation;
    
    NSLog(@"%@: my salary changed on %6.2f%%, inflation was %6.2f%%, my income changed on %6.2f%%",
          self.name, salaryVariationPercent,
          self.inflation,
          incomeChangesPercent);
    
    self.salary = salary;
    
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    float averagePrice = [notification.userInfo[ALGovernmentAveragePriceUserInfoKey] floatValue];
    
    float variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    self.inflation = variationPercent;
    
    //NSLog(@"%@: inflation was %6.2f %%", self.name, variationPercent);
}


- (void) ALDoctorDidEnterBackgroundNotification: (NSNotification*) notification {
    NSLog(@"%@ is going home.", self.name);
}

- (void) ALDoctorWillEnterForegroundNotification: (NSNotification*) notification {
    NSLog(@"%@ backed to work.", self.name);
}

@end
