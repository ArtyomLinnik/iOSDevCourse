//
//  ALSettingsViewController.h
//  SettingsTest
//
//  Created by Artyom Linnik on 19/07/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALSettingsViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *levelControl;

@property (weak, nonatomic) IBOutlet UISwitch *shadowsSwitch;

@property (weak, nonatomic) IBOutlet UISegmentedControl *detalizationControl;

@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;




- (IBAction)actionTextChanged:(UITextField *)sender;
- (IBAction)actionValueChanged:(id)sender;



@end
