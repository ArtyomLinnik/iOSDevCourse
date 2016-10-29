//
//  ALDirectoryViewController.m
//  FileManagerTest
//
//  Created by Artyom Linnik on 03/08/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALDirectoryViewController.h"

typedef enum {
	ALCreateFolder,
	ALBackToRoot
} ALActionSheetSection;

@interface ALDirectoryViewController () <UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIAlertViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) NSArray *contents;

@property (weak,nonatomic) UITableView *tabelView;
@property (strong,nonatomic) NSArray *folderItem;
@property (strong,nonatomic) NSMutableArray *item;

@end

@implementation ALDirectoryViewController

- (id)initWithFolderPath:(NSString *)path
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        
        self.path = path;
		self.folderItem = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:nil];
        
    }
    return self;
}

- (void)setPath:(NSString *)path
{
    _path = path;
    
    NSError *error = nil;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path
                                                                        error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [self.tableView reloadData];
    
    self.navigationItem.title = [self.path lastPathComponent];

}


- (void)loadView {
	[super loadView];
	
	CGRect rect = self.view.bounds;
	rect.origin = CGPointZero;
	
	UITableView *tabelView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
	tabelView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	
	tabelView.dataSource = self;
	tabelView.delegate = self;
	tabelView.separatorInset = UIEdgeInsetsZero;
	tabelView.backgroundColor = [UIColor colorWithRed:0.192 green:0.192 blue:0.192 alpha:1.000];
	tabelView.separatorColor = [UIColor colorWithRed:0.114 green:0.118 blue:0.098 alpha:1.000];
	
	[self.view addSubview:tabelView];
	self.tabelView = tabelView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!self.path) {
        self.path = @"/";
    }
	
	self.title = [self.path lastPathComponent];
	self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.192 green:0.192 blue:0.192 alpha:1.000];
	self.item = [[NSMutableArray alloc]init];
	
	for (NSString *fileName in self.folderItem) {
		if (![fileName rangeOfString:@"."].location == 0) {
			[self.item addObject:fileName];
		}
	}
	
	NSArray *sortedArray = [self.item sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
		
		if ([self isFile:obj1] && [self isFile:obj2]) {
			return [obj1 compare:obj2];
		} else if ([self isFile:obj1] && ![self isFile:obj2]) {
			return NSOrderedDescending;
		} else {
			return ![obj1 compare:obj2];
		}
	}];
	
	self.item = [NSMutableArray arrayWithArray:sortedArray];
	
	UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToRoot:)];
	
	self.navigationItem.rightBarButtonItem = item;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	
    if (self.navigationController.viewControllers.count > 1) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Back to Root"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(actionBackToRoot:)];
        self.navigationItem.rightBarButtonItem = item;
    }

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"path = %@", self.path);
    NSLog(@"view controllers on stack = %lu", self.navigationController.viewControllers.count);
    NSLog(@"index on stack %lu", [self.navigationController.viewControllers indexOfObject:self]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)dealloc
{
    NSLog(@"controller with path %@ has been deallocated", self.path);
}

- (BOOL)isDirectoryAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    
    NSString *filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectotry = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectotry];
    
    return isDirectotry;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifire = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifire];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifire];
    }
    
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fileName;
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"file.png"];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString *fileName = [self.contents objectAtIndex:indexPath.row];

        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        
        //ALDirectoryViewController *vc = [[ALDirectoryViewController alloc] initWithFolderPath:path];
        //[self.navigationController pushViewController:vc animated:YES];
        
        ALDirectoryViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ALDirectoryViewController"];
        vc.path = path;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Actions

- (void)actionBackToRoot:(UIBarButtonItem *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == ALCreateFolder) {
		UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"set folder name" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
		alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
		[alertView textFieldAtIndex:0].keyboardAppearance = UIKeyboardAppearanceDark;
		[alertView textFieldAtIndex:0].delegate = self;
		[alertView show];
		
	} else if (buttonIndex == ALBackToRoot) {
		[self.navigationController popToRootViewControllerAnimated:YES];
	}
}

#pragma mark - Methods

- (BOOL) isFile:(id)obj {
	
	BOOL isFile = NO;
	
	NSString *path = [self.path stringByAppendingPathComponent:obj];
	
	[[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isFile];
	
	return !isFile;
}

- (void) createFolderWithName:(NSString *)name {
	if (name != nil) {
		
		BOOL isFolder;
		NSString *filePath = [self.path stringByAppendingPathComponent:name];
		NSFileManager *fileManager= [NSFileManager defaultManager];
		if(![fileManager fileExistsAtPath:filePath isDirectory:&isFolder]) {
			if(![fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:NULL]) {
				NSLog(@"Create folder failed %@", filePath);
			}
		}
		
		NSUInteger insertIndex = 0;
		
		[self.item insertObject:name atIndex:insertIndex];
		
		[self.tabelView beginUpdates];
		
		NSIndexPath *indexpath = [NSIndexPath indexPathForItem:insertIndex inSection:insertIndex];
		
		[self.tabelView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexpath] withRowAnimation:UITableViewRowAnimationTop];
		
		[self.tabelView endUpdates];
		
	}
}

- (unsigned long long)sizeOfFolder:(NSString *)folderPath {
	
	unsigned long long int result = 0;
	
	NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:nil];
	
	for (NSString *fileSystemItem in array) {
		BOOL directory = NO;
		[[NSFileManager defaultManager] fileExistsAtPath:[folderPath stringByAppendingPathComponent:fileSystemItem] isDirectory:&directory];
		if (!directory) {
			result += [[[[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:fileSystemItem] error:nil] objectForKey:NSFileSize] unsignedIntegerValue];
		}
		else {
			result += [self sizeOfFolder:[folderPath stringByAppendingPathComponent:fileSystemItem]];
		}
	}
	
	return result;
}


@end
