//
//  ViewController.h
//  ButtonTest
//
//  Created by Artyom Linnik on 27/06/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)clear:(id)sender;
- (IBAction)clearAll:(id)sender;
- (IBAction)digit:(id)sender;
- (IBAction)inverseSign:(id)sender;
- (IBAction)operation:(id)sender;

@end

