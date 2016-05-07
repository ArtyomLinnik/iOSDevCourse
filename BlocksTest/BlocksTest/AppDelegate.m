//
//  AppDelegate.m
//  BlocksTest
//
//  Created by Artyom Linnik on 04/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "AppDelegate.h"
#import "ALObject.h"

typedef void (^OurTestBlock)(void);

typedef NSString* (^OurTestBlock2)(NSInteger);

@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlock testBlock;

@property (strong, nonatomic) NSString* name;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    [self testMethod];
    [self testMethodWithParams];
    NSString *result = [self testMethodWithReturnValueAndParams:@"Test String" value:111];
     
    NSLog(@"%@", result);
    */
    /*
    void (^testBlock) (void);
    
    testBlock = ^{
        NSLog(@"test block");
    };
    
    testBlock();
    
    void (^testBlockWithParams) (NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
        NSLog(@"testBlockWithParams %@ %d", string, intValue);
    };
    
    testBlockWithParams(@"string", 111);
    

    
    NSString* (^testBlockWithReturnValueAndParams) (NSString*, NSInteger) = ^(NSString* string, NSInteger intValue) {
        return [NSString stringWithFormat:@"testBlockWithReturnValueAndParams %@ %d", string, intValue];
    };
    
    NSString* result = testBlockWithReturnValueAndParams(@"string", 111);
    
    NSLog(@"%@", result);
    */
    /*
    __block NSString* testString = @"How is it possible";
    
    __block NSInteger i = 0;
    
    void (^testBlock2) (void);
    
    testBlock2 = ^{
        NSLog(@"test block");
        i++;
        testString = [NSString stringWithFormat:@"How is it possible? %d",i];
        NSLog(@"%@", testString);
    };

    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    testBlock2();
    
     NSArray* array = nil;
     
     
     NSComparisonResult (^bbb)(id, id) = ^(id obj1, id obj2){
     return NSOrderedAscending;
     };
     
     array = [array sortedArrayUsingComparator:bbb];
     
     
     void (^ccc)(void);
     
     ccc = ^{
     NSLog(@"BLOCK!!!");
     };
     
     [self testBlocksMethod:ccc];
     */
    
    
    
    /*
     [self testBlocksMethod:^{
     NSLog(@"BLOCK!!!");
     }];*/
    /*
     OurTestBlock testBlock2 = ^{
     NSLog(@"BLOCK 2!!!");
     };
     
     [self testBlocksMethod:testBlock2];
     */
    /*
     OurTestBlock2 tb = ^(NSInteger intValue){
     return [NSString stringWithFormat:@"%d", intValue];
     };
     
     NSLog(@"%@", tb(5));
     */
    /*
     ASObject* obj = [[ASObject alloc] init];
     obj.name = @"OBJECT";
     
     
     __weak ASObject* weakObj = obj;
     
     obj = nil;
     
     self.testBlock = ^ {
     NSLog(@"%@", weakObj.name);
     };
     
     self.testBlock();
     */
    
    self.name = @"Hello!";
    
    ALObject* obj1 = [[ALObject alloc] init];
    obj1.name = @"OBJECT";
    
    
     [obj1 testMethod:^{
     NSLog(@"%@", self.name);
     }];
     

    
    
    return YES;
}
- (void) testMethod {
    NSLog(@"test method!");
}

- (void) testMethodWithParams:(NSString*) string value:(NSInteger) intValue {
    NSLog(@"testMethodWithParams %@ %d", string, intValue);
}

- (NSString*) testMethodWithReturnValueAndParams:(NSString*) string value:(NSInteger) intValue {
    return [NSString stringWithFormat:@"testMethodWithReturnValueAndParams %@ %d", string, intValue];
}

- (void) testBlocksMethod:(void (^)(void)) testBlock {
    
    NSLog(@"testBlocksMethod");
    
    testBlock();
    testBlock();
    testBlock();
    testBlock();
}

- (void) testBlocksMethod2:(OurTestBlock) testBlock {
    
    NSLog(@"testBlocksMethod");
    
    testBlock();
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
