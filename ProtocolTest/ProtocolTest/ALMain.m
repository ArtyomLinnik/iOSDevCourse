//
//  ALMain.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALMain.h"

#import "ALJumper.h"
#import "ALSwimmer.h"
#import "ALRunner.h"

@interface ALMain()

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation ALMain

#pragma mark - LifeCycles

- (void)main {
    [self setup];
}

- (void)setup {
    [self initialize];
    [self cycles];
}

- (void)initialize {
    NSMutableArray *array = [NSMutableArray array];
    
    for (int index = 0; index < 100; index++) {
        ALJumper *jumper = [[ALJumper alloc] initWithName:@"Jumper" Index:index];
        ALSwimmer *swimmer = [[ALSwimmer alloc] initWithName:@"Swimmer" Index:index];
        ALRunner *runner = [[ALRunner alloc] initWithName:@"Runner" Index:index];
        
        [array addObject:jumper];
        [array addObject:swimmer];
        [array addObject:runner];
        
        
    }
    self.array = array;
}

- (void)cycles {
    for (id obj in self.array) {
        [self objectCheck:obj];
        NSLog(@"-------------------------------");
    }
}

#pragma mark - Help methods

- (void)objectCheck:(id)obj {
    if ([obj isKindOfClass:[ALJumper class]]) {
        ALJumper *jumper = (ALJumper *)obj;
        [jumper about];
        [jumper jump];
        if ([jumper respondsToSelector:@selector(run)]) {
            [jumper run];
        }
        if ([jumper respondsToSelector:@selector(swim)]) {
            [jumper swim];
        }
    } else if ([obj isKindOfClass:[ALRunner class]]) {
        ALRunner *runner = (ALRunner *)obj;
        [runner about];
        [runner run];
        if ([runner respondsToSelector:@selector(swim)]) {
            [runner swim];
        }
        if ([runner respondsToSelector:@selector(jump)]) {
            [runner jump];
        }
    } else if ([obj isKindOfClass:[ALSwimmer class]]) {
        ALSwimmer *swimmer = (ALSwimmer *)obj;
        [swimmer about];
        [swimmer swim];
        if ([swimmer respondsToSelector:@selector(run)]) {
            [swimmer run];
        }
        if ([swimmer respondsToSelector:@selector(jump)]) {
            [swimmer jump];
        }
    }
}


@end
