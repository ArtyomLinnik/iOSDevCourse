//
//  ALGovernment.m
//  NotificationsTest
//
//  Created by Artyom Linnik on 23/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALGovernment.h"

NSString* const ALGovernmentTaxLevelDidChangeNotification = @"ALGovernmentTaxLevelDidChangeNotification";
NSString* const ALGovernmentSalaryDidChangeNotification = @"ALGovernmentSalaryDidChangeNotification";
NSString* const ALGovernmentPensionDidChangeNotification = @"ALGovernmentPensionDidChangeNotification";
NSString* const ALGovernmentAveragePriceDidChangeNotification = @"ALGovernmentAveragePriceDidChangeNotification";

NSString* const ALGovernmentTaxLevelUserInfoKey = @"ALGovernmentTaxLevelUserInfoKey";
NSString* const ALGovernmentSalaryUserInfoKey = @"ALGovernmentSalaryUserInfoKey";
NSString* const ALGovernmentPensionUserInfoKey = @"ALGovernmentPensionUserInfoKey";
NSString* const ALGovernmentAveragePriceUserInfoKey = @"ALGovernmentAveragePriceUserInfoKey";

@implementation ALGovernment

- (id)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 10.f;
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(ALGovernmentDidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(ALGovernmentWillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
    }
    return self;
}

- (void) setTaxLevel:(float)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:ALGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ALGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setSalary:(float)salary {
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:ALGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ALGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(float)pension {
    
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:ALGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ALGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

- (void) setAveragePrice:(float)averagePrice {
    
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:ALGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ALGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

- (void) ALGovernmentDidEnterBackgroundNotification: (NSNotification*) notification {
    
    NSLog(@"Government is going down.");
    
}

- (void) ALGovernmentWillEnterForegroundNotification: (NSNotification*) notification {
    
    NSLog(@"Government is rising up.");
    
}


@end
