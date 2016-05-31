//
//  ALSingleton.h
//  DobleScreenApp
//
//  Created by Artyom Linnik on 26/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALSingleton : NSObject
{
    NSString *currentString;
}


+ (ALSingleton *) sharedInstance;

- (void)setStringMeth:(NSString *)string;

- (NSString *)currentString;

@end
