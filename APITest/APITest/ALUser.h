//
//  ALUser.h
//  APITest
//
//  Created by Artyom Linnik on 2/14/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALServerObject.h"

@interface ALUser : ALServerObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSURL *imageURL;



@end
