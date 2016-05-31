//
//  CollectionViewController.m
//  TableView
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController()

@property (strong, nonatomic) NSMutableArray *array1;

@end


@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    
    self.array1 = [NSMutableArray new];
    for (int i = 0 ; i<20; i++) {
        [self.array1 addObject:[NSString stringWithFormat:@"%i",i]];
    }

    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array1.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(150,150);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
    CGRect labelFrame = CGRectMake(0,0 , 100, 40);
    UILabel *myLabel = [cell viewWithTag:1];
    [myLabel setBackgroundColor:[UIColor orangeColor]];
    myLabel.text = @"1";
    
    
    return cell;
}

@end
