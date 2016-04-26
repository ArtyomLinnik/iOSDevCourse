//
//  ALGovernment.h
//  NotificationsTest
//
//  Created by Artyom Linnik on 23/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const ALGovernmentTaxLevelDidChangeNotification;
extern NSString* const ALGovernmentSalaryDidChangeNotification;
extern NSString* const ALGovernmentPensionDidChangeNotification;
extern NSString* const ALGovernmentAveragePriceDidChangeNotification;

extern NSString* const ALGovernmentTaxLevelUserInfoKey;
extern NSString* const ALGovernmentSalaryUserInfoKey;
extern NSString* const ALGovernmentPensionUserInfoKey;
extern NSString* const ALGovernmentAveragePriceUserInfoKey;

@interface ALGovernment : NSObject

@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float salary;
@property (assign, nonatomic) float pension;
@property (assign, nonatomic) float averagePrice;

@end
