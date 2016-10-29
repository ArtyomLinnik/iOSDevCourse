//
//  ALSection.h
//  SearchTest
//
//  Created by Artyom Linnik on 10/08/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALSection : NSObject

@property (strong, nonatomic) NSString *sectionName;
@property (strong, nonatomic) NSMutableArray *itemsArray;

@end