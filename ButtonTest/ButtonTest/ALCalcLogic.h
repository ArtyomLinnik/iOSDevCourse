//
//  ALCalcLogic.h
//  ButtonTest
//
//  Created by Artyom Linnik on 01/07/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALCalcLogicDeligate;

@interface ALCalcLogic : NSObject

@property (strong, nonatomic) NSString *firstData;
@property (strong, nonatomic) NSString *secondData;
@property (strong, nonatomic) NSString *tempData;

@property (weak, nonatomic) id <ALCalcLogicDeligate> delegate;

- (void)plus;
- (void)minus;
- (void)divide;
- (void)multiply;
- (void)addData:(NSString *)data;
- (void)equals;
- (void)clear;

@end

@protocol ALCalcLogicDeligate <NSObject>

- (void)updateDisplayWithData:(NSString *)data;

@end
