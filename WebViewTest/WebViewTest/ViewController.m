//
//  ViewController.m
//  WebViewTest
//
//  Created by Artyom Linnik on 28/10/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	/*
	NSString *urlString = @"https://vk.com/iosdevcourse";
	
	NSURL *url = [NSURL URLWithString:urlString];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	[self.webView loadRequest:request];
	*/
	
	/*
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];
	
	NSData *fileData = [NSData dataWithContentsOfFile:filePath];
	
	[self.webView loadData:fileData
				  MIMEType:@"application/plf"
		  textEncodingName:@"UTF-8"
				   baseURL:nil];
	 */
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1.pdf" ofType:nil];
	
	NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
	
	[self.webView loadRequest:request];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)actionBack:(id)sender
{
	if ([self.webView canGoBack]) {
		[self.webView stopLoading];
		[self.webView goBack];
	}
}

- (IBAction)actionForward:(id)sender
{
	if ([self.webView canGoForward]) {
		[self.webView stopLoading];
		[self.webView goForward];
	}
}

- (IBAction)actionRefresh:(id)sender
{
	[self.webView stopLoading];
	[self.webView reload];
}

- (void)refreshButtons
{
	self.backButtonItem.enabled = [self.webView canGoBack];
	self.forwardButtonItem.enabled = [self.webView canGoForward];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	NSLog(@"shouldStartLoadWithRequest %@", [request debugDescription]);
	
	return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	NSLog(@"webViewDidStartLoad");
	
	[self.indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	NSLog(@"webViewDidFinishLoad");
	
	[self.indicator stopAnimating];
	
	[self refreshButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
	NSLog(@"didFailLoadWithError");
	
	[self.indicator stopAnimating];
	
	[self refreshButtons];
}

@end
