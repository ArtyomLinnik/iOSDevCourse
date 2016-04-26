//
//  AppDelegate.m
//  NotificationsTest
//
//  Created by Artyom Linnik on 15/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "AppDelegate.h"
#import "ALDoctor.h"
#import "ALGovernment.h"
#import "ALBuissnessMan.h"

@interface AppDelegate ()
@property (strong, nonatomic) ALGovernment* government;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:ALGovernmentTaxLevelDidChangeNotification
                                               object:nil];
    
    self.government = [[ALGovernment alloc] init];
    
    ALBuissnessMan* buissnesman = [[ALBuissnessMan alloc] init];
    ALDoctor* doctor1 = [[ALDoctor alloc] init];
    ALDoctor* doctor2 = [[ALDoctor alloc] init];
    ALDoctor* doctor3 = [[ALDoctor alloc] init];
    ALDoctor* doctor4 = [[ALDoctor alloc] init];
    ALDoctor* doctor5 = [[ALDoctor alloc] init];
    
    buissnesman.taxLevel = self.government.taxLevel;
    
    doctor1.salary = doctor2.salary = doctor3.salary = doctor4.salary = doctor5.salary = self.government.salary;
    
    
    self.government.taxLevel = 5.5f;
    self.government.salary = 1100;
    self.government.averagePrice = 15;
    self.government.pension = 550;
    
    
    self.government.salary = 1050;
    
    self.government.salary = 1150;
    
    
    self.government.salary = 900;

    
    
    
    return YES;
}

- (void) governmentNotification:(NSNotification*) notification {
    
    //NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
    
}


- (void) dealloc {
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:ASGovernmentTaxLevelDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
