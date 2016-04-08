//
//  AppDelegate.m
//  ProtocolTest
//
//  Created by Artyom Linnik on 03/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "AppDelegate.h"
#import "ALPatient.h"
#import "ALStudent.h"
#import "ALDancer.h"
#import "ALDeveloper.h"

/*
@interface AppDelegate ()

@end
*/
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ALDancer* dancer1 = [[ALDancer alloc] init];
    ALDancer* dancer2 = [[ALDancer alloc] init];
    
    ALStudent* student1 = [[ALStudent alloc] init];
    ALStudent* student2 = [[ALStudent alloc] init];
    ALStudent* student3 = [[ALStudent alloc] init];
    
    ALDeveloper* developer1 = [[ALDeveloper alloc] init];
    
    dancer1.name = @"dancer1";
    dancer2.name = @"dancer2";
    
    student1.name = @"student1";
    student2.name = @"student2";
    student3.name = @"student3";
    
    developer1.name = @"developer1";
    
    NSArray* patients = [NSArray arrayWithObjects:dancer1, student1, developer1, student2, student3, dancer2, nil];
    
    for (id <ALPatient> patient in patients)
    {
        NSLog(@"Patient name = %@", patient.name);
        
        if ([patient respondsToSelector:@selector(howIsYourFamily)]) {
            NSLog(@"How is your family? \n%@", [patient howIsYourFamily]);
        }
        if ([patient respondsToSelector:@selector(howIsYourJob)]) {
            NSLog(@"How is job family? \n%@", [patient howIsYourJob]);
        }
        
        
        if (![patient areYouOK]) {
            [patient takePill];
            
            if (![patient areYouOK]) {
                [patient makeShot];
            }
        }
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
