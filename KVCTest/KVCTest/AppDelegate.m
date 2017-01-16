//
//  AppDelegate.m
//  KVCTest
//
//  Created by Artyom Linnik on 12/08/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "AppDelegate.h"
#import "ALStudent.h"
#import "ALGroup.h"

@interface AppDelegate ()

//@property (strong, nonatomic) ALStudent *student;

@property (strong, nonatomic) NSArray *groups;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ALStudent *student1 = [ALStudent new];
	student1.name = @"Alex";
	student1.age = 20;
	
	ALStudent *student2 = [ALStudent new];
	student2.name = @"Roger";
	student2.age = 22;
	
	ALStudent *student3 = [ALStudent new];
	student3.name = @"John";
	student3.age = 21;
	
	ALStudent *student4 = [ALStudent new];
	student4.name = @"Carl";
	student4.age = 19;
	
	ALGroup *group1 = [ALGroup new];
	
	group1.students = @[student1, student2, student3, student4];
	
	
	
	/*
	[group1 addObserver:self
			  forKeyPath:@"student"
				 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
				 context:NULL];
	
	NSLog(@"%@", group1.students);
	
	NSMutableArray *array = [group1 mutableArrayValueForKey:@"students"];
	
	[array removeLastObject];
	
	NSLog(@"%@", array);
	*/
	
	
	/*
	[student addObserver:self
			  forKeyPath:@"name"
				 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
				 context:NULL];
	
    student.name = @"Alex";
    student.age = 20;
    
    NSLog(@"%@", student);
    
    [student setValue:@"Roger" forKey:@"name"];
    [student setValue:@25 forKey:@"age"];
    
    NSLog(@"name1 = %@, name2 = %@", student.name, [student valueForKey:@"name"]);
    
    NSLog(@"%@", student);
	
	[student changeName];
	
	NSLog(@"%@", student);
	
	[student setValue:@"Carl" forKey:@"name1"];
	
	NSLog(@"%@", student);
	
	self.student = student;
	*/
	
	/*
	self.student = student1;
	
	NSLog(@"name = %@", [self valueForKeyPath:@"student.name"]);
	
	//NSString *name = @"Alex1111";
	
	NSNumber *name = @6;
	
	NSError *error = nil;
	
	if (![self.student validateValue:&name forKey:@"name" error:&error]) {
		NSLog(@"%@", error);
	}
	*/
	
	ALStudent *student5 = [ALStudent new];
	student3.name = @"Ron";
	student3.age = 26;
	
	ALStudent *student6 = [ALStudent new];
	student4.name = @"Jack";
	student4.age = 18;
	
	ALGroup *group2 = [ALGroup new];
	
	group2.students = @[student5, student6];
	
	NSLog(@"%@",student5);
	
	self.groups = @[group1, group2];
	
	NSLog(@"groups count = %@", [self valueForKeyPath:@"groups.@count"]);
	
	NSArray *allStudents = [self valueForKeyPath:@"groups.@distinctUnionOfArrays.students"];
	
	NSLog(@"all students = %@", allStudents);
	
	NSNumber *minAge = [allStudents valueForKeyPath:@"@min.age"];
	NSNumber *maxAge = [allStudents valueForKeyPath:@"@max.age"];
	NSNumber *sumAge = [allStudents valueForKeyPath:@"@sum.age"];
	NSNumber *avgAge = [allStudents valueForKeyPath:@"@avg.age"];
	
	NSLog(@"minAge = %@\nmaxAge = %@\nsumAge = %@, avgAge = %@", minAge, maxAge, sumAge, avgAge);
	
	NSArray *allNames = [allStudents valueForKeyPath:@"@distinctUnionOfObjects.name"];
	
	NSLog(@"all names = %@", allNames);
	
    return YES;
}

-(void)dealloc {
	//[self.student removeObserver:self forKeyPath:@"student"];
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

#pragma mark - Observing

- (void)observeValueForKeyPath:(nullable NSString *)keyPath
					  ofObject:(nullable id)object
						change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change 
					   context:(nullable void *)context {
	
	NSLog(@"observeValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
	
	//id value = [change objectForKey:NSKeyValueChangeNewKey];
	
}


@end
