//
//  AppDelegate.m
//  ThreadsTest
//
//  Created by Artyom Linnik on 08/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //[self performSelectorInBackground:@selector(testThread) withObject:nil];
    
    //[[NSThread currentThread] isMainThread];
    /*
     for (int i = 0; i < 50; i++) {
     NSThread* thread = [[NSThread alloc] initWithTarget:self selector:@selector(testThread) object:nil];
     thread.name = [NSString stringWithFormat:@"Thread #%d", i + 1];
     [thread start];
     }
     */
    
    /*
     
     NSThread* thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"x"];
     NSThread* thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(addStringToArray:) object:@"0"];
     thread1.name = @"Thread 1";
     thread2.name = @"Thread 2";
     [thread1 start];
     [thread2 start];
     
     
     
     
     */
    
    self.array = [NSMutableArray array];
    
    //dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_queue_t queue = dispatch_queue_create("com.alinnik.testthreads.queue", DISPATCH_QUEUE_SERIAL);
    
    __weak id weakSelf = self;
    
    dispatch_async(queue, ^{
        [weakSelf addStringToArray:@"x"];
    });
    dispatch_async(queue, ^{
        [weakSelf addStringToArray:@"0"];
    });
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //UI refresh
        });
    });
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    
    return YES;
}

- (void) testThread {
    
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        for (int i = 0; i < 200000; i++) {
        }
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        
        //[self performSelectorOnMainThread:<#(SEL)#> withObject:<#(id)#> waitUntilDone:<#(BOOL)#>];
    }
    
}

- (void) addStringToArray:(NSString*) string {
    
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
        //@synchronized(self) {
        
        NSLog(@"%@ calculations started", [[NSThread currentThread] name]);
        
        for (int i = 0; i < 200000; i++) {
            [self.array addObject:string];
        }
        
        NSLog(@"%@ calculations ended", [[NSThread currentThread] name]);
        
        //}
        
        
        
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
        
    }
    
}

- (void) printArray {
    NSLog(@"%@", self.array);
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
