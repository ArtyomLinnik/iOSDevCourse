//
//  ALStudent.h
//  DictionaryTest
//
//  Created by Artyom Linnik on 06/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALStudent : NSObject

@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* greetingPhrase;

- (NSString*) description;


@end
