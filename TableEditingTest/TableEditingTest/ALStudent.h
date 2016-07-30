//
//  ALStudent.h
//  TableEditingTest
//
//  Created by Artyom Linnik on 21/07/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) float averageGrade;

+ (ALStudent *)randomStudent;

@end
