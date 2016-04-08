//
//  ALParrentClass.h
//  FunctionsTest
//
//  Created by Artyom Linnik on 25/03/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALParrentClass : NSObject

+ (void) whoAreYou;

- (void) sayHello;
- (void) say:(NSString*) string;
- (void) say:(NSString*) string1 and:(NSString*) string2;
- (NSString*) saySomething;

@end
