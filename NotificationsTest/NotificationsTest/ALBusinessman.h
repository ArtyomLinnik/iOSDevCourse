//
//  ALBuissnessMan.h
//  NotificationsTest
//
//  Created by Artyom Linnik on 26/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALBusinessman : NSObject

@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float averagePrice;
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float inflation;

@end
