//
//  ALPensioner.m
//  NotificationsTest
//
//  Created by Artyom Linnik on 03/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALPensioner.h"
#import "ALGovernment.h"

@implementation ALPensioner

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(pensionChangedNotification:)
                   name:ALGovernmentPensionDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:ALGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(ALPensionerDidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(ALPensionerWillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) pensionChangedNotification: (NSNotification*) notification {
    
    float pension = [notification.userInfo[ALGovernmentPensionUserInfoKey] floatValue];
    
    float pensionVariationPercent = (self.pension == 0) ? 0 : (pension/self.pension-1)*100;
    
    float incomeChangesPercent = pensionVariationPercent - self.inflation;
    
    NSLog(@"%@: my pension changed on %6.2f%%, inflation was %6.2f%%, my income changed on %6.2f%%",
          self.name, pensionVariationPercent,
          self.inflation,
          incomeChangesPercent);
    
    self.pension = pension;
    
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    float averagePrice = [notification.userInfo[ALGovernmentAveragePriceUserInfoKey] floatValue];
    
    float variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    self.inflation = variationPercent;
    
    //NSLog(@"%@: inflation was %6.2f %%", self.name, variationPercent);
    
}

- (void) ALPensionerDidEnterBackgroundNotification: (NSNotification*) notification {
    
    NSLog(@"%@ goes on veterans meeting.", self.name);
    
}

- (void) ALPensionerWillEnterForegroundNotification: (NSNotification*) notification {
    
    NSLog(@"%@ returned to big politics.", self.name);
    
}

@end
