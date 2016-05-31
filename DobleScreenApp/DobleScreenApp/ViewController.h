//
//  ViewController.h
//  DobleScreenApp
//
//  Created by Artyom Linnik on 23/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (strong, nonatomic) NSString *numberLabelContents;

@end
