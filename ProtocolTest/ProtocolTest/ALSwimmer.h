//
//  ALSwimmer.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALSwimmers.h"
#import "ALPerson.h"

@interface ALSwimmer : ALPerson <ALSwimmers>


@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSInteger speedOfSwimming;
@property (assign, nonatomic) BOOL canRun;
@property (assign, nonatomic) BOOL canJump;

- (instancetype)initWithName:(NSString *) name Index:(NSInteger)index;


@end
