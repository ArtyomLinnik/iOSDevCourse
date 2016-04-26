//
//  ALSwimmers.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 06/04/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALSwimmers <NSObject>

@required
@property (assign, nonatomic) CGFloat speed;
@property (assign, nonatomic) NSInteger number;
- (void) swim;

@optional
- (NSString*) howDoYouFeel;

@end
