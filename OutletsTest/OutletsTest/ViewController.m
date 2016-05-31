//
//  ViewController.m
//  OutletsTest
//
//  Created by Artyom Linnik on 17/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor*) randomColor
{
    CGFloat r = (float)(arc4random() % 256) / 255;
    CGFloat g = (float)(arc4random() % 256) / 255;
    CGFloat b = (float)(arc4random() % 256) / 255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:0.8f];
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    self.testView.backgroundColor = [self randomColor];
}

@end
