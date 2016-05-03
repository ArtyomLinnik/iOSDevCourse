//
//  ALObserver.m
//  NotificationsTest
//
//  Created by Artyom Linnik on 03/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALObserver.h"

@implementation ALObserver

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(DidFinishLaunchingNotification:)
                   name:UIApplicationDidFinishLaunchingNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(WillResignActiveNotification:)
                   name:UIApplicationWillResignActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(DidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(WillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(DidBecomeActiveNotification:)
                   name:UIApplicationDidBecomeActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(WillTerminateNotification:)
                   name:UIApplicationWillTerminateNotification
                 object:nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) DidFinishLaunchingNotification: (NSNotification*) notification {
    
    NSLog(@"DidFinishLaunchingNotification Analog");
    
}

- (void) WillResignActiveNotification: (NSNotification*) notification {
    
    NSLog(@"WillResignActiveNotification Analog");
    
}

- (void) DidEnterBackgroundNotification: (NSNotification*) notification {
    
    NSLog(@"DidEnterBackgroundNotification Analog");
    
}

- (void) WillEnterForegroundNotification: (NSNotification*) notification {
    
    NSLog(@"WillEnterForegroundNotification Analog");
    
}

- (void) DidBecomeActiveNotification: (NSNotification*) notification {
    
    NSLog(@"DidBecomeActiveNotification Analog");
    
}

- (void) WillTerminateNotification: (NSNotification*) notification {
    
    NSLog(@"WillTerminateNotification Analog");
    
}

@end
