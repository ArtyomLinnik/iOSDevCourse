//
//  ViewController.h
//  TextFieldsTest
//
//  Created by Artyom Linnik on 05/07/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;

- (IBAction)actionLog:(id)sender;
- (IBAction)actionTextChange:(UITextField *)sender;

@end

