//
//  CollectionViewController.m
//  CollectionView
//
//  Created by Artyom Linnik on 18/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController()

@property (strong, nonatomic) NSMutableArray *array1;
//@property (assign, nonatomic) CGRect myFrame;

@end

@implementation CollectionViewController

- (void)viewDidLoad
{
    self.array1 = [NSMutableArray new];
    for (int i = 0 ; i<50; i++) {
        [self.array1 addObject:[NSString stringWithFormat:@"%i",i]];
    }
    
    //self.myFrame = CGRectMake(0, 0, arc4random() % 40 + 80, arc4random() % 40 + 80);
    
    [super viewDidLoad];

    
    self.collectionView.backgroundColor = [UIColor grayColor];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array1.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    
    
    
    cell.textLable.text = [NSString stringWithFormat:@"%li", indexPath.row];
    
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //self.myFrame = CGRectMake(0, 0, arc4random() % 40 + 80, arc4random() % 40 + 80);
    
    return CGSizeMake(arc4random() % 40 + 80, arc4random() % 40 + 80);
}


@end
