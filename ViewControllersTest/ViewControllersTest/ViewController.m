//
//  ViewController.m
//  ViewControllersTest
//
//  Created by Artyom Linnik on 12/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Loading

- (void) loadView {
    
    [super loadView];
    
    NSLog(@"loadView");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        NSLog(@"iPad");
    } else {
        NSLog(@"iPhone");
    }
}


#pragma mark - Views

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
    
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    NSLog(@"viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    NSLog(@"viewDidLayoutSubviews");
}

#pragma mark - Orientation

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    NSLog(@"willRotateToInterfaceOrientation from %ld to %ld", (long)self.interfaceOrientation, (long)toInterfaceOrientation);
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    NSLog(@"didRotateFromInterfaceOrientation from %ld to %ld", (long)fromInterfaceOrientation, (long)self.interfaceOrientation);
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
