//
//  TableViewController.m
//  TableView
//
//  Created by Artyom Linnik on 16/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController()

//@property (strong, nonatomic) NSArray *array;

@property (strong, nonatomic) NSMutableArray *array1;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect labelFrame = CGRectMake(0,0 , 100, 40);
    UILabel *myLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [myLabel setBackgroundColor:[UIColor orangeColor]];
    
    [myLabel setText:@"1"];
    self.array1 = [NSMutableArray new];
    for (int i = 0 ; i<20; i++) {
        [self.array1 addObject:[NSString stringWithFormat:@"%i",i]];
       // self.array1 = [NSMutableArray arrayWithObjects:@"%d",i, nil];
    }
    
    
        //self.array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    cell.textLabel.text =  self.array1[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40 + arc4random()%40;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array1.count;
}



@end
