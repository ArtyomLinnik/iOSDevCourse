//
//  ALPostCell.m
//  APITest
//
//  Created by Artyom Linnik on 2/16/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALPostCell.h"

@implementation ALPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightForText:(NSString *)text
{
	CGFloat offset = 5.0;

	UIFont *font = [UIFont systemFontOfSize:17.f];
	
	NSShadow *shadow = [NSShadow new];
	shadow.shadowOffset = CGSizeMake(0, -1);
	shadow.shadowBlurRadius = 0.5;
	
	NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
	[paragraph setLineBreakMode:NSLineBreakByWordWrapping];
	[paragraph setAlignment:NSTextAlignmentCenter];
	
	NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
								font, NSFontAttributeName,
								paragraph, NSParagraphStyleAttributeName,
								shadow, NSShadowAttributeName, nil];
	
	CGRect rect = [text boundingRectWithSize:CGSizeMake(320 - 2 * offset, CGFLOAT_MAX)
									 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
								  attributes:attributes
									 context:nil];
	
	return CGRectGetHeight(rect) + 2 * offset ;
}

@end
