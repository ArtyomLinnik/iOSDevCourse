//
//  ViewController.m
//  SwitchTest
//
//  Created by Artyom Linnik on 26/05/16.
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

- (IBAction)switchPressed:(id)sender {
    if (_switch1.on) {
        self.label.text = @"Switch is on";
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.label.text = @"Switch is off";
        self.view.backgroundColor = [UIColor redColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
