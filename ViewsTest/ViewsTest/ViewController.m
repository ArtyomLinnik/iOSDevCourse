//
//  ViewController.m
//  ViewsTest
//
//  Created by Artyom Linnik on 12/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:view1];

    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 50, 250)];
    view2.backgroundColor = [[UIColor greenColor]colorWithAlphaComponent:0.8];
    view2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    [self.view addSubview:view2];
    
    self.testView = view2;
    */
    
    UIView *viewBGBlack = [[UIView alloc] initWithFrame:CGRectMake(16, 100, 288, 288)];
    viewBGBlack.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1];
    
    UIView *viewBGWhite = [[UIView alloc] initWithFrame:CGRectMake(17, 101, 286, 286)];
    viewBGWhite.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
    
    CGRect blackRect = CGRectMake(3, 3, 35, 35);
    
    for (int i = 0; i < 8; i++) {
        for (int j=0; j<4; j++) {
            UIView *viewBlackRect = [[UIView alloc] initWithFrame:blackRect];
            viewBlackRect.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1];
            
            blackRect.origin.x +=70;
        }
        
        if (i%2) {
            blackRect.origin.x = 3;
        } else {
            blackRect.origin.x = 38;
        }
        blackRect.origin.y += 35;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"\nframe = %@\nbounds = %@",NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
}

@end
