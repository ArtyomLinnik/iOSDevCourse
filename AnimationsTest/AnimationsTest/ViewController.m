//
//  ViewController.m
//  AnimationsTest
//
//  Created by Artyom Linnik on 17/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view];
    
    self.testView = view;
  }


- (UIColor*) randomColor
{
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}


- (void) moveView:(UIView*) view
{
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGFloat s = (float)(arc4random() % 151) / 100.f + 0.5f;
    
    CGFloat r = (float)(arc4random() % (int)(M_PI*2*10000)) / 10000 - M_PI;
    
    CGFloat d = (float)(arc4random() % 20001) / 10000 + 2;
    
    [UIView animateWithDuration:d
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut  //| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         view.center = CGPointMake(x, y);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(s, 1/s);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animation finished! %d", finished);
                         NSLog(@"\nview frame = %@\nview bounds = %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
                         
                         __weak UIView *v = view;
                         [self moveView:v];
                     }];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self moveView:self.testView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
