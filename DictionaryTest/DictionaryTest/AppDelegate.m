//
//  AppDelegate.m
//  DictionaryTest
//
//  Created by Artyom Linnik on 06/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "AppDelegate.h"
#import "ALStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*
    NSDictionary* dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"Petrov", @"lastName",
                                @"Vasiliy", @"name",
                                [NSNumber numberWithInt:25], @"age",
                                nil];
    */
    //NSDictionary dictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:<#(nonnull id), ...#>, nil]
    
    /*
    NSInteger number = 30;
    
    NSDictionary* dictionary3 = @{@"lastName":@"Petrov", @"age":@25, @"speed":@(number )};

    NSLog(@"%@ \ncount = %d", dictionary3, [dictionary3 count]);
    
    for (NSString* key in [dictionary3 allKeys])
    {
        id obj = [dictionary3 objectForKey:key];
        
        NSLog(@"key = %@, value = %@", key, obj);
    }
    */
    
    ALStudent* student1 = [[ALStudent alloc] init];
    student1.firstName = @"Raphael";
    student1.lastName = @"Nadal";
    student1.greetingPhrase = @"Vamos!";
    
    ALStudent* student2 = [[ALStudent alloc] init];
    student2.firstName = @"Roger";
    student2.lastName = @"Federer";
    student2.greetingPhrase = @"Come on!";
    
    NSDictionary *studentDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                       student1, [student1.lastName stringByAppendingString:student1.firstName],
                                       student2, [student2.lastName stringByAppendingString:student2.firstName],
                                       nil];
    
    //NSLog(@"%@",studentDictionary);
    
    
    for (NSString *keyDictionary in [studentDictionary allKeys])
    {
        id tempObj = [studentDictionary objectForKey:keyDictionary];
        NSLog(@"%@", tempObj);
    }
    
    return YES;
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
