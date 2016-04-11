//
//  AppDelegate.m
//  DelegatesTest
//
//  Created by Artyom Linnik on 07/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "AppDelegate.h"
#import "ALDoctor.h"
#import "ALPatient.h"
#import "ALBadDoctor.h"

//@interface AppDelegate ()
//
//@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*
    ALPatient* patient1 = [[ALPatient alloc] init];
    patient1.name = @"Vova";
    patient1.temperature = 36.6f;
    
    ALPatient* patient2 = [[ALPatient alloc] init];
    patient2.name = @"Petya";
    patient2.temperature = 38.8f;
    
    ALDoctor* doctor1 = [[ALDoctor alloc] init];
    
    patient1.delegate = doctor1;
    patient2.delegate = doctor1;
    
    
    NSLog(@"%@ are you ok? %@", patient1.name, [patient1 howAreYou] ? @"YES" : @"NO");
    
    NSLog(@"%@ are you ok? %@", patient2.name, [patient2 howAreYou] ? @"YES" : @"NO");
    */
    
    NSArray* arrayName = [NSArray arrayWithObjects:@"Vasya", @"Denis", @"Tanja", @"Masha", @"Katya", nil];
    NSMutableArray* arrayPatient = [NSMutableArray array];
    
    ALDoctor* doctor = [[ALDoctor alloc] init];
    ALBadDoctor* badDoctor = [[ALBadDoctor alloc] init];
    
    CGFloat isBadDoctor;
    
    for (int i=0; i<15; i++) {
        ALPatient* patient = [[ALPatient alloc] init];
        patient.name = [NSString stringWithFormat:@"%@", [arrayName objectAtIndex:arc4random()%5]];
        isBadDoctor = arc4random() % 11;
        if (isBadDoctor < 3) {
            patient.delegate = badDoctor;
        } else patient.delegate = doctor;
        [arrayPatient addObject:patient];
    }
    
    for (ALPatient* patient in arrayPatient) {
        [patient goToDoctor];
    }
    
    [doctor report];
    
    for (ALPatient* patient in arrayPatient ) {
        if (patient.mark == NO) patient.delegate = doctor;
    }
    
    for (ALPatient* patient in arrayPatient) {
        [patient goToDoctor];
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
