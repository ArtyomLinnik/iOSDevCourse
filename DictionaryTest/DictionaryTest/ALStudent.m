//
//  ALStudent.m
//  DictionaryTest
//
//  Created by Artyom Linnik on 06/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALStudent.h"

@implementation ALStudent

- (NSString*) description
{
    NSString *tempString;
    tempString = [NSString stringWithFormat:@"student's name: %@; student's surName: %@, student's phrase: %@", self.firstName, self.lastName, self.greetingPhrase];
    return tempString;
}

@end
