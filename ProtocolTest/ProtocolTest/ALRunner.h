//
//  ALRunner.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALRunnersProtocol.h"
#import "ALPerson.h"

@interface ALRunner : ALPerson <ALRunnersProtocol>

@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) NSInteger speedRun;

- (instancetype)initWithName:(NSString *) name Index:(NSInteger)index;

@end
