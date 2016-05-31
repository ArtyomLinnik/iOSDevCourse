//
//  ViewController.m
//  TouchesTest
//
//  Created by Artyom Linnik on 17/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView *draggingView;

@property (assign, nonatomic) CGPoint touchOffset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view];
    
    //self.testView = view;
    
    //self.view.multipleTouchEnabled = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) logTouches:(NSSet *)touches withMethod:(NSString *)methodName
{
    NSMutableString *string = [NSMutableString stringWithString:methodName];
    
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        [string appendFormat:@" %@", NSStringFromCGPoint(point)];
    }
    
    NSLog(@"%@",string);
    
}


#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self logTouches:touches withMethod:@"touchesBegan"];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint pointOnMainView = [touch locationInView:self.view];
    
    UIView *view = [self.view hitTest:pointOnMainView withEvent:event];
    
    if (![view isEqual:self.view]) {
        self.draggingView = view;
        
        CGPoint touchPoint = [touch locationInView:self.draggingView];
        
        self.touchOffset = CGPointMake(CGRectGetMidX(self.draggingView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.draggingView.bounds) - touchPoint.y);
        
        //[self.draggingView.layer removeAllAnimations];
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.draggingView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
                             self.draggingView.alpha = 0.3f;
                         }];
        
    } else {
        
        self.draggingView = nil;

    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self logTouches:touches withMethod:@"touchesMoved"];
    if (self.draggingView) {
        
        UITouch *touch = [touches anyObject];
        
        CGPoint pointOnMainView = [touch locationInView:self.view];
        
        CGPoint correction  = CGPointMake(pointOnMainView.x + self.touchOffset.x,
                                          pointOnMainView.y + self.touchOffset.y);
        
        self.draggingView.center = correction;
    }
    
}

- (void) onTouchesEnded
{
    self.draggingView = nil;
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.draggingView.transform = CGAffineTransformIdentity;
                         self.draggingView.alpha = 1.f;
                     }];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self logTouches:touches withMethod:@"touchesEnded"];
    
    [self onTouchesEnded];
    
}
- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self logTouches:touches withMethod:@"touchesCancelled"];
    
    [self onTouchesEnded];
}

@end
