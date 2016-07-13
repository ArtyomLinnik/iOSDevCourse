//
//  View.m
//  DobleScreenApp
//
//  Created by Artyom Linnik on 19/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "ALSingleton.h"

@interface TableViewController()

@property (strong, nonatomic) NSMutableArray *name;
@property (strong, nonatomic) NSMutableArray *thumbnails;

@end


@implementation TableViewController
@synthesize myTableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    self.title = @"Numbers";
    
    
    self.name = [NSMutableArray new];
    for (int i = 0 ; i<30; i++) {
        [self.name addObject:[NSString stringWithFormat:@"space3_%i",i+1]];
        [self.thumbnails addObject:[NSString stringWithFormat:@"space3_%i.JPG",i+1]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.name.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [self.name objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"space3_1.JPG"];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.name objectAtIndex:indexPath.row];
    
    ALSingleton *singleton = [ALSingleton sharedInstance];
    [singleton setStringMeth: [self.name objectAtIndex:indexPath.row]];
    
    
    [self performSegueWithIdentifier:@"viewSegue" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"viewSegue"]) {
        
        ALSingleton *singleton = [ALSingleton sharedInstance];
        
        
        NSString *lableString = [singleton currentString];
        
        [[segue destinationViewController] setNumberLabelContents:lableString];
         
    }

}


@end
