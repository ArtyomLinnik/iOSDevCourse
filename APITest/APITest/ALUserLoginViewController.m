//
//  ALUserLoginViewController.m
//  APITest
//
//  Created by Artyom Linnik on 2/14/17.
//  Copyright © 2017 Artyom Linnik. All rights reserved.
//

#import "ALUserLoginViewController.h"
#import "ALAccessToken.h"

@interface ALUserLoginViewController () <UIWebViewDelegate>

@property (copy, nonatomic) ALLoginCopletionBlock complitionBlock;
@property (weak, nonatomic) UIWebView *webView;

@end

@implementation ALUserLoginViewController

- (id)initWithCompilationBlock:(ALLoginCopletionBlock)completionBlock
{
	self = [super init];
	if (self) {
		self.complitionBlock = completionBlock;
	}
	 return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	CGRect r = self.view.bounds;
	r.origin = CGPointZero;
	
	UIWebView *webView = [[UIWebView alloc] initWithFrame:r];
	
	webView.autoresizingMask =  UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	
	[self.view addSubview:webView];
	
	self.webView = webView;
	
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
																		  target:self
																		  action:@selector(actionCancel:)];
	[self.navigationItem setRightBarButtonItem:item animated:NO];
	
	self.navigationItem.title = @"Login";
	
	NSString *urlString =
						   @"https://oauth.vk.com/authorize?"
						   "client_id=5874889&"
						   "scope=139286&"
						   "redirect_uri=https://oauth.vk.com/blank.html&"
						   "display=mobile&"
						   "v=5.62&"
						   "response_type=token";
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	webView.delegate = self;
	
	[webView loadRequest:request];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
	self.webView.delegate = nil;
}

#pragma mark - Actions

- (void)actionCancel:(UIBarButtonItem *)item
{
	if (self.complitionBlock) {
		self.complitionBlock(nil);
	}
	[self dismissViewControllerAnimated:YES
							 completion:nil];
}


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	//http://hello.there/#access_token=48d84e33e2210cde13a8400e86f10955c09093cb0cfa12d77bf409a336679c16620eb97badbfa61b9b306&expires_in=86400&user_id=49677772
	
	NSLog(@"%@", [request URL]);
	
	if ([[[request URL] host] isEqualToString:@"hello.there"]) {
		
		ALAccessToken *token = [ALAccessToken new];
		
		NSString *query =  [[request URL] description];
		
		NSArray* array = [query componentsSeparatedByString:@"#"];
		
		if (array.count > 1) {
			query = [array lastObject ];
		}
		
		NSArray *pairs = [query componentsSeparatedByString:@"&"];
		
		for (NSString* pair in pairs) {
			
			NSArray* values = [pair componentsSeparatedByString:@"="];
			
			if ([values count] == 2) {
				
				NSString* key = [values firstObject];
				
				if ([key isEqualToString:@"access_token"]) {
					token.token = [values lastObject];
				} else if ([key isEqualToString:@"expires_in"]) {
					
					NSTimeInterval interval = [[values lastObject] doubleValue];
					
					token.expirationDate = [NSDate dateWithTimeIntervalSinceNow:interval];
					
				} else if ([key isEqualToString:@"user_id"]) {
					
					token.userID = [values lastObject];
				}
			}
		}
		
		self.webView.delegate = nil;
		
		if (self.complitionBlock) {
			self.complitionBlock(token);
		}
		
		[self dismissViewControllerAnimated:YES
								 completion:nil];
		
		
		return NO;
	}
	
	return YES;
}


@end
