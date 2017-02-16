//
//  ALGroupWallViewController.m
//  APITest
//
//  Created by Artyom Linnik on 2/15/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALGroupWallViewController.h"
#import "ALServerManager.h"
#import "ALPostCell.h"
#import "ALPost.h"
#import "ALUser.h"

@interface ALGroupWallViewController ()

@property (strong, nonatomic) NSMutableArray *postsArray;
@property (assign, nonatomic) BOOL firstTimeAppear;

@end

@implementation ALGroupWallViewController

static NSInteger postsInRequest = 20;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.postsArray = [NSMutableArray array];
	
	self.firstTimeAppear = YES;
	
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	UIRefreshControl* refresh = [[UIRefreshControl alloc] init];
	[refresh addTarget:self action:@selector(refreshWall) forControlEvents:UIControlEventValueChanged];
	self.refreshControl = refresh;
	
	UIBarButtonItem *plus = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
																		  target:self
																		  action:@selector(postOnWall:)];
	
	self.navigationItem.rightBarButtonItem = plus;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:YES];
	
	if (self.firstTimeAppear) {
		self.firstTimeAppear = NO;
		
		[[ALServerManager sharedManager] authorizeUser:^(ALUser *user) {
			NSLog(@"AUTHORIZED!");
			NSLog(@"%@ %@", user.firstName, user.lastName);
		}];
	}
	
	
}

#pragma mark - API

- (void)postOnWall:(id)sender
{
	[[ALServerManager sharedManager] postText:@"Это тест из ВК апи!"
								  onGroupWall:@"58860049"
									onSuccess:^(id result) {
										
									} onFailure:^(NSError *error, NSInteger statusCode) {
									
									}];
}

- (void)refreshWall
{
	[[ALServerManager sharedManager] getGroupWall:@"58860049"
									   withOffset:0
											count:MAX(postsInRequest, self.postsArray.count)
										onSuccess:^(NSArray *posts) {
											
											[self.postsArray removeAllObjects];
											
											[self.postsArray addObjectsFromArray:posts];
											
											[self.tableView reloadData];
											
											[self.refreshControl endRefreshing];
										}
										onFailure:^(NSError *error, NSInteger statusCode) {
											NSLog(@"error = %@, code = %ld", [error localizedDescription], (long)statusCode);
											[self.refreshControl endRefreshing];
										}];

}

- (void)getPostsFromServer {
	[[ALServerManager sharedManager] getGroupWall:@"58860049"
									   withOffset:self.postsArray.count
											count:postsInRequest
												onSuccess:^(NSArray *posts) {
													
													[self.postsArray addObjectsFromArray:posts];
													
													//[self.tableView reloadData];
													
													NSMutableArray *newPaths = [NSMutableArray array];
													for (int i = (int)self.postsArray.count - (int)posts.count; i < self.postsArray.count; i++) {
														[newPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];
													}
													
													[self.tableView beginUpdates];
													[self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationTop];
													[self.tableView endUpdates];
													
												}
												onFailure:^(NSError *error, NSInteger statusCode) {
													NSLog(@"error = %@, code = %ld", [error localizedDescription], (long)statusCode);
												}];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.postsArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.row == self.postsArray.count) {
		
		static NSString *identifier = @"Cell";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
		
		if (!cell) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
		}
		
		cell.textLabel.text = @"LOAD MORE";
		cell.imageView.image = nil;
		
		return cell;
		
	} else {
		
		static NSString *identifier = @"PostCell";
		
		ALPostCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
		
		ALPost *post = [self.postsArray objectAtIndex:indexPath.row];
		
		cell.postTextLabel.text = post.text;
		
		return cell;
	}
//	return nil;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (indexPath.row == self.postsArray.count) {
		[self getPostsFromServer];
	}
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == self.postsArray.count) {
		return  44.f;
	} else {
		
		ALPost *post = [self.postsArray objectAtIndex:indexPath.row];
		
		return [ALPostCell heightForText: post.text];
	}
}

@end
