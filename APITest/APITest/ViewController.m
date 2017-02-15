//
//  ViewController.m
//  APITest
//
//  Created by Artyom Linnik on 1/19/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"
#import "ALServerManager.h"
#import "ALUser.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *friendsArray;
@property (assign, nonatomic) BOOL firstTimeAppear;

@end

@implementation ViewController

static NSInteger friendsInRequest = 20;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.friendsArray = [NSMutableArray array];
	
	//[self getFriendsFromServer];
	
	self.firstTimeAppear = YES;
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


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - API

- (void)getFriendsFromServer {
	[[ALServerManager sharedManager] getFriendsWithOffset:self.friendsArray.count count:friendsInRequest
												onSuccess:^(NSArray *friends) {
													[self.friendsArray addObjectsFromArray:friends];
													
													//[self.tableView reloadData];
													
													NSMutableArray *newPaths = [NSMutableArray array];
													for (int i = (int)self.friendsArray.count - (int)friends.count; i < self.friendsArray.count; i++) {
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
	return self.friendsArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *identifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	
	if (indexPath.row == self.friendsArray.count) {
		cell.textLabel.text = @"LOAD MORE";
		cell.imageView.image = nil;
	} else {
	
		ALUser *friend = [self.friendsArray  objectAtIndex:indexPath.row];
	
		cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", friend.firstName, friend.lastName];
		
		NSURLRequest *request =  [NSURLRequest requestWithURL:friend.imageURL];
		
		__weak UITableViewCell *weakCell = cell;
		
		cell.imageView.image = nil;
		
		[cell.imageView setImageWithURLRequest:request
							  placeholderImage:nil
									   success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
										   weakCell.imageView.image = image;
										   [weakCell layoutSubviews];
									   }
									   failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
										   
									   }];
	}
	return cell;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (indexPath.row == self.friendsArray.count) {
		[self getFriendsFromServer];
	}
}


@end
