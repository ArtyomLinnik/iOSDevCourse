//
//  AppDelegate.h
//  ParametersTest
//
//  Created by Artyom Linnik on 01/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Object;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (copy, nonatomic) Object* object;

@end

