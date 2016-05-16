//
//  ALJumpersProtocol.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALMain.h"

@protocol ALJumpersProtocol <NSObject>

@required
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSInteger heightOfTheJump;

- (void)jump;

@optional
@property (assign, nonatomic) NSInteger speedRun;
@property (assign, nonatomic) NSInteger speedOfSwimming;

- (void)run;
- (void)swim;

@end