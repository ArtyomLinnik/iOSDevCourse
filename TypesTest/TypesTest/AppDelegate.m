//
//  AppDelegate.m
//  TypesTest
//
//  Created by Artyom Linnik on 02/04/16.
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
    BOOL boolVar = YES;
    
    NSInteger intVar = 10;
    
    NSUInteger uIntVar = 100;
    
    CGFloat floatVar = 1.5f;
    
    double doubleVar = 2.5f;
    
    NSNumber* boolObj = [NSNumber numberWithBool:boolVar];
    NSNumber* intObj = [NSNumber numberWithInteger:intVar];
    NSNumber* uIntlObj = [NSNumber numberWithUnsignedInteger:uIntVar];
    NSNumber* floatObj = [NSNumber numberWithFloat:floatVar];
    NSNumber* doubleObj = [NSNumber numberWithDouble:doubleVar];
    
    NSArray* array2 = [NSArray arrayWithObjects:boolObj, intObj, uIntlObj, floatObj, doubleObj, nil];
    
    NSLog(@"boolVar = %d, intVar = %d, uIntVar = %d, floatVar = %f, doubleVar = %f",
          [[array2 objectAtIndex:0] boolValue],
          [[array2 objectAtIndex:1] integerValue],
          [[array2 objectAtIndex:2] unsignedIntegerValue],
          [[array2 objectAtIndex:3] floatValue],
          [[array2 objectAtIndex:4] doubleValue]);
    
    
    NSLog(@"boolVar = %d, intVar = %d, uIntVar = %d, floatVar = %f, doubleVar = %f", boolVar, intVar, uIntVar, floatVar, doubleVar);
    NSLog(@"boolVar = %ld, intVar = %ld, uIntVar = %ld, floatVar = %ld, doubleVar = %ld", sizeof(boolVar), sizeof(intVar), sizeof(uIntVar), sizeof(floatVar), sizeof(doubleVar));
    */
    /*
    ALStudent* studentA = [[ALStudent alloc] init];
    
    studentA.name = @"Best Student";
    
    NSLog(@"StudentA name = %@", studentA.name);
    
    ALStudent* studentB = studentA;
    
    studentB.name = @"Bad student";
    
    NSLog(@"StudentA name = %@", studentA.name);
    */
    /*
    NSInteger a = 10;
    
    NSLog(@"a = %d", a);
    
    NSInteger b = a;
    
    b = 13;
    
    NSLog(@"a = %d, b = %d", a, b);
    
    NSInteger * c = &a;
    
    *c = 8;
    */
    /*
    CGPoint point;
    point.x = 5.5f;
    point.y = 10;
    
    
    point = CGPointMake(3, 6);
    
    
    CGSize size;
    
    size.height = 10;
    size.width = 5;
    
    CGRect rect;
    
    rect.origin = point;
    rect.size = size;
    
    rect = CGRectMake(0, 0, 30, 60);
    */
    
    ALStudent* student = [[ALStudent alloc] init];
    [student setGender:ALGenderMale];
    
    
    
    CGPoint point1 = CGPointMake(0, 5);
    CGPoint point2 = CGPointMake(3, 4);
    CGPoint point3 = CGPointMake(2, 8);
    CGPoint point4 = CGPointMake(7, 1);
    CGPoint point5 = CGPointMake(4, 4);
    
    
    NSArray* array3 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:point1],
                       [NSValue valueWithCGPoint:point2],
                       [NSValue valueWithCGPoint:point3],
                       [NSValue valueWithCGPoint:point4],
                       [NSValue valueWithCGPoint:point5],
                       nil];
    
    for (NSValue* value in array3)
    {
        CGPoint p = [value CGPointValue];
        NSLog(@"point =  %@", NSStringFromCGPoint(p));
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
