//
//  ALPostCell.h
//  APITest
//
//  Created by Artyom Linnik on 2/16/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALPostCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *postTextLabel;

+ (CGFloat)heightForText:(NSString *)text;

@end
