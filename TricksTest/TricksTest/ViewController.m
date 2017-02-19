//
//  ViewController.m
//  TricksTest
//
//  Created by Artyom Linnik on 2/19/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"
#import "ALUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSLog(@"%@",fancyDateStringFromDate([NSDate date]));
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
