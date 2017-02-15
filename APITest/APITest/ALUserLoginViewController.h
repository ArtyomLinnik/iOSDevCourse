//
//  ALUserLoginViewController.h
//  APITest
//
//  Created by Artyom Linnik on 2/14/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALAccessToken;

typedef void(^ALLoginCopletionBlock)(ALAccessToken *token);

@interface ALUserLoginViewController : UIViewController

- (id)initWithCompilationBlock:(ALLoginCopletionBlock)completionBlock;

@end
