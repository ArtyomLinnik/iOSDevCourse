//
//  ALUser.m
//  APITest
//
//  Created by Artyom Linnik on 2/14/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALUser.h"

@implementation ALUser

- (id)initWithServerResponse:(NSDictionary *)responseObject
{
	self = [super initWithServerResponse:responseObject];
	if (self) {
		self.firstName = [responseObject objectForKey:@"first_name"];
		self.lastName = [responseObject objectForKey:@"last_name"];
		
		NSString *urlString = [responseObject objectForKey:@"photo_50"];
		
		if (urlString) {
			self.imageURL = [NSURL URLWithString:urlString];
		}
		
	}
	return self;
}

@end
