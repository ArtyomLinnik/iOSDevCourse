//
//  ALUtils.m
//  TricksTest
//
//  Created by Artyom Linnik on 2/19/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALUtils.h"

NSString * fancyDateStringFromDate(NSDate *date) {
	
	static NSDateFormatter *formatter = nil;
	
	if (!formatter) {
		formatter =  [NSDateFormatter new];
		[formatter setDateFormat:@"-- dd : MM : yy --"];
	}
	return [formatter stringFromDate:date];
}


