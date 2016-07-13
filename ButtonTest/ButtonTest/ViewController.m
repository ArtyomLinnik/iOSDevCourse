//
//  ViewController.m
//  ButtonTest
//
//  Created by Artyom Linnik on 27/06/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
double x, y;
NSInteger operation;

BOOL enterFlag;
BOOL yFlag;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (IBAction)clear:(id)sender {
    
    x = 0;
    
    [self calcScreen];
    
}

- (IBAction)clearAll:(id)sender {
    
    x = 0;
    y = 0;
    
    enterFlag = NO;
    yFlag = NO;
    [self calcScreen];
    
}

- (IBAction)digit:(id)sender {
    
    if (enterFlag) {
        
        y = x;
        x = 0;
        enterFlag = NO;
    }
    
    x = (10.0f * x) + [sender tag];
    
    [self calcScreen];
}

- (IBAction)inverseSign:(id)sender {
    
    x = -x;
    [self calcScreen];
}

- (IBAction)operation:(id)sender {
    
    if (yFlag && !enterFlag) {
        
        
        if (operation == 1001) {
            x = y + x;
        }
        
        if (operation == 1002) {
            x = y - x;
        }
        
        if (operation == 1003) {
            x = y * x;
        }
        
        if (operation == 1004) {
            x = y / x;
        }
    }
    
    y = x;
    enterFlag = YES;
    yFlag = YES;
    
    operation = [sender tag];
    
    [self calcScreen];
    
}


-(void) calcScreen {
    
    NSString *str = [NSString stringWithFormat:@"%.16g", x];
    [self.displayLabel setText:str];
}
@end