//
//  ALPost.m
//  APITest
//
//  Created by Artyom Linnik on 2/15/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALPost.h"

@implementation ALPost

- (id)initWithServerResponse:(NSDictionary *)responseObject
{
	self = [super initWithServerResponse:responseObject];
	if (self) {
		self.text = [responseObject objectForKey:@"text"];
		self.text = [self.text stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
	}
	return self;
}


@end
