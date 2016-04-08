//
//  ALStudent.h
//  TypesTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    ALGenderMale,
    ALGenderFemale
} ALGender;


@interface ALStudent : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) ALGender gender;

@end
