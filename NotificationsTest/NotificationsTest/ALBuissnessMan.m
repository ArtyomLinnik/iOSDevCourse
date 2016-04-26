//
//  ALBuissnessMan.m
//  NotificationsTest
//
//  Created by Artyom Linnik on 26/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALBuissnessMan.h"
#import "ALGovernment.h"

@implementation ALBuissnessMan

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:ALGovernmentTaxLevelDidChangeNotification
                 object:nil];

    }
    return self;
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void) taxLevelChangedNotification:(NSNotification*) notification
{
    NSNumber* value = [notification.userInfo objectForKey:ALGovernmentTaxLevelUserInfoKey];
    
    float taxLevel = [value floatValue];
    
    if (taxLevel > self.taxLevel) {
        NSLog(@"Buissenesmen are NOT happy");
    } else {
        NSLog(@"Buissenesmen are happy");
    }
    
    self.taxLevel = taxLevel;
    
}


@end
