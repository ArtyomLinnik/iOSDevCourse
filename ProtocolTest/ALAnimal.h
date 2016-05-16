//
//  ALAnimal.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ALAnimal : NSObject

@property (strong, nonatomic) NSString *breed;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;

- (instancetype)initWithName:(NSString *) breed Index:(NSInteger)index;
- (void)move;

@end
