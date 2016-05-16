//
//  ALJumper.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALPerson.h"
#import "ALJumpersProtocol.h"

@interface ALJumper : ALPerson <ALJumpersProtocol>

@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSInteger heightOfTheJump;

- (instancetype)initWithName:(NSString *) name Index:(NSInteger)index;

@end
