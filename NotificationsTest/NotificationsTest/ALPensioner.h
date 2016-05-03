//
//  ALPensioner.h
//  NotificationsTest
//
//  Created by Artyom Linnik on 03/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALPensioner : NSObject

@property (assign, nonatomic) float pension;
@property (assign, nonatomic) float averagePrice;
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float inflation;

@end
