//
//  ALSwimmers.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 06/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALMain.h"

@protocol ALSwimmers <NSObject>


@required
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSInteger speedOfSwimming;

- (void)swim;

@optional
@property (assign, nonatomic) NSInteger speedRun;
@property (assign, nonatomic) NSInteger heightOfTheJump;

- (void)run;
- (void)jump;

@end
