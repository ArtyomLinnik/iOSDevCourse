//
//  ViewController.m
//  ImageDownload
//
//  Created by Artyom Linnik on 11/05/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *downloadTask1 = [session downloadTaskWithURL:[NSURL URLWithString:@"http://productopropio.com/wp-content/uploads/2015/07/Kenia4.jpg"]];
    NSURLSessionDownloadTask *downloadTask2 = [session downloadTaskWithURL:[NSURL URLWithString:@"http://fullhdpictures.com/wp-content/uploads/2016/03/Jungle-Wallpaper-HD.jpeg"]];
    NSURLSessionDownloadTask *downloadTask3 = [session downloadTaskWithURL:[NSURL URLWithString:@"https://static.pexels.com/photos/5342/sea-beach-footprint-steps.jpg"]];
    NSURLSessionDownloadTask *downloadTask4 = [session downloadTaskWithURL:[NSURL URLWithString:@"https://images.sciencedaily.com/2015/04/150420122828_1_900x600.jpg"]];
    NSURLSessionDownloadTask *downloadTask5 = [session downloadTaskWithURL:[NSURL URLWithString:@"http://miroved.com/public/media/articles/2015/08/14/8fb6596bfd77402e8c6281f0dca5128e-African-Safari.jpg"]];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:downloadTask1, downloadTask2, downloadTask3, downloadTask4, downloadTask5, nil];
    
    for (NSURLSessionDownloadTask* task in array) {
    [task resume];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSData *data = [NSData dataWithContentsOfURL:location];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressView setHidden:YES];
        [self.imageView setImage:[UIImage imageWithData:data]];
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.progressView setProgress:progress];
    });
}

@end
