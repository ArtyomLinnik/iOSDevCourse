//
//  ALStudent.h
//  BlocksTest
//
//  Created by Artyom Linnik on 07/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* surName;

@property (assign, nonatomic) float temperature;
@property (assign, nonatomic) BOOL cough;
@property (assign, nonatomic) BOOL nausea;
@property (assign, nonatomic) BOOL chills;
@property (assign, nonatomic) float countSymptoms;
@property (assign, nonatomic) NSInteger soreSpot;

- (BOOL)fellsBad;

@end
