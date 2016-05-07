//
//  ALObject.h
//  BlocksTest
//
//  Created by Artyom Linnik on 07/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ObjectBlock)(void);


@interface ALObject : NSObject

@property (strong, nonatomic) NSString* name;

- (void) testMethod:(ObjectBlock) block;

@end
