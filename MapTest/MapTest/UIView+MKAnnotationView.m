//
//  UIView+MKAnnotationView.m
//  MapTest
//
//  Created by Artyom Linnik on 26/10/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "UIView+MKAnnotationView.h"
#import <MapKit/MKAnnotationView.h>

@implementation UIView (MKAnnotationView)

- (MKAnnotationView *)superAnnotationView
{
	if ([self isKindOfClass:[MKAnnotationView class]]) {
		return (MKAnnotationView *)self;
	}
	
	if (!self.superview) {
		return nil;
	}
	
	return [self.superview superAnnotationView];
}

@end
