//
//  UIView+MKAnnotationView.h
//  MapTest
//
//  Created by Artyom Linnik on 26/10/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKAnnotationView;

@interface UIView (MKAnnotationView)

- (MKAnnotationView *)superAnnotationView;

@end
