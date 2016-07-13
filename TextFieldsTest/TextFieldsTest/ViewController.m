//
//  ViewController.m
//  TextFieldsTest
//
//  Created by Artyom Linnik on 05/07/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Actions

- (IBAction)actionLog:(id)sender
{
    NSLog(@"FirstName = %@", self.firstNameField.text);
}


- (IBAction)actionTextChange:(UITextField *)sender
{
    NSLog(@"%@", sender.text);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

@end
