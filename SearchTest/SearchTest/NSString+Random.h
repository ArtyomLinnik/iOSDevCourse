//
//  NSString+Random.h
//  SearchTest
//
//  Created by Artyom Linnik on 10/08/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Random)

+ (NSString *)randomAlphanumericString;
+ (NSString *)randomAlphanumericStringWithLenght:(NSInteger)length;

@end