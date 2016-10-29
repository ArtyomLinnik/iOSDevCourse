//
//  ViewController.m
//  PopoversTest
//
//  Created by Artyom Linnik on 09/10/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"
#import "ALDetailViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIPopoverController *popover;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)showControllerAsModal:(UIViewController *)vc
{
	[self presentViewController:vc
					   animated:YES
					 completion:^{
						 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
							 [self dismissViewControllerAnimated:YES completion:nil];
						 });
					 }];

}

- (IBAction)actionPress:(UIButton *)sender {
	
	ALDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ALDetailsViewController"];
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		
		
		
		UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:vc];
		/*
		[popover presentPopoverFromBarButtonItem:sender
						permittedArrowDirections:UIPopoverArrowDirectionAny
										animated:YES]; */
	} else {
		[self showControllerAsModal:vc];
	}
}

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
	
	ALDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ALDetailsViewController"];
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		
		
		UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:vc];
		
		[popover presentPopoverFromBarButtonItem:sender
						permittedArrowDirections:UIPopoverArrowDirectionAny
										animated:YES];
		self.popover = popover;
		
	} else {
		[self showControllerAsModal:vc];
	}

	
}
@end
