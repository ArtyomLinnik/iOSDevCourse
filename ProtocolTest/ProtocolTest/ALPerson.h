//
//  ALPerson.h
//  ProtocolTest
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Gender) {
    GenderMale,
    GenderFemale
};

@interface ALPerson : UICollectionViewController

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;
@property (assign, nonatomic) Gender gender;
@property (assign, nonatomic) NSInteger index;

- (instancetype)initWithName:(NSString *) name Index:(NSInteger)index;
- (void)move;
- (void)genderCall;
- (void)about;

@end
