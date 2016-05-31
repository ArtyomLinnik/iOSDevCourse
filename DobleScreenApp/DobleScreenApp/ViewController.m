//
//  ViewController.m
//  DobleScreenApp
//
//  Created by Artyom Linnik on 23/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController()

@end

@implementation ViewController
@synthesize numberLabel;
@synthesize navbar;
@synthesize numberLabelContents;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.numberLabel.text = self.numberLabelContents;
    self.navbar.title = self.numberLabelContents;
    
}

@end
