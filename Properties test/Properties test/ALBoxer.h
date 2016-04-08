//
//  ALBoxer.h
//  Properties test
//
//  Created by Artyom Linnik on 30/03/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALBoxer : NSObject

@property (strong, nonatomic) NSString*  name;
@property (assign, nonatomic) int age;
@property (assign, nonatomic) float height;
@property (assign, nonatomic) float weight;



- (NSInteger) howOldAreYou;



@end
