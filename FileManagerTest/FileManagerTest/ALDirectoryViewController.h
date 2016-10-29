//
//  ALDirectoryViewController.h
//  FileManagerTest
//
//  Created by Artyom Linnik on 03/08/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALDirectoryViewController : UITableViewController

@property (strong, nonatomic) NSString *path;

- (id)initWithFolderPath:(NSString *)path;

@end
