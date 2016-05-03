//
//  ALBuissnessMan.m
//  NotificationsTest
//
//  Created by Artyom Linnik on 26/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALBusinessman.h"
#import "ALGovernment.h"

@implementation ALBusinessman

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:ALGovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:ALGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(ALBusinessmanDidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(ALBusinessmanWillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) taxLevelChangedNotification: (NSNotification*) notification {
    
    float taxLevel = [notification.userInfo[ALGovernmentTaxLevelUserInfoKey] floatValue];
    
    float taxLevelVariationPercent = (self.taxLevel == 0) ? 0 : (taxLevel/self.taxLevel-1)*100;
    
    float incomeChangesPercent = self.inflation - taxLevelVariationPercent;
    
    NSLog(@"%@: tax level changed on %6.2f%%, income changed on %6.2f%%, my profit changed to %6.2f%%",
          self.name, taxLevelVariationPercent,
          self.inflation,
          incomeChangesPercent);
    
    self.taxLevel = taxLevel;
    
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    float averagePrice = [notification.userInfo[ALGovernmentAveragePriceUserInfoKey] floatValue];
    
    float variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    self.inflation = variationPercent;
    
    //NSLog(@"%@: inflation was %6.2f %%", self.name, variationPercent);
}

- (void) ALBusinessmanDidEnterBackgroundNotification: (NSNotification*) notification {
    
    NSLog(@"%@ goes to the lunch.", self.name);
    
}

- (void) ALBusinessmanWillEnterForegroundNotification: (NSNotification*) notification {
    
    NSLog(@"%@ come back to the office.", self.name);
    
}

@end
