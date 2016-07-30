//
//  ViewController.m
//  DynanicCellsTest
//
//  Created by Artyom Linnik on 21/07/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ViewController.h"
#import "ALStudent.h"
#import "ALObject.h"

static NSString* firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

typedef enum {
    ALStudentGood,
    ALStudentNormal,
    ALStudentBad
} ALStudentType;

static int namesCount = 50;

@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *arrayColor;
@property (nonatomic,strong) NSMutableArray *student;
@property (nonatomic,strong) NSArray *studentType;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.student = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 50; i++) {
        
        ALStudent *studentObj = [[ALStudent alloc]init];
        
        studentObj.firstName = firstNames[arc4random() % namesCount];
        studentObj.secondName = lastNames[arc4random() % namesCount];
        studentObj.averageMark = arc4random_uniform(11) + 2;
        
        [self.student addObject:studentObj];
        
    }
    
    self.arrayColor = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 10; i++) {
        
        ALObject *obj = [[ALObject alloc]init];
        
        CGFloat r = (CGFloat)(arc4random() % 256) / 255;
        CGFloat g = (CGFloat)(arc4random() % 256) / 255;
        CGFloat b = (CGFloat)(arc4random() % 256) / 255;
        
        NSString *name = [NSString stringWithFormat:@"RGB {%f,%f,%f}",r,g,b];
        UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.f];
        
        obj.name = name;
        obj.color = color;
        
        [self.arrayColor addObject:obj];
        
    }
    
    
    NSArray *sortedObj = [self.student sortedArrayUsingComparator: ^(id a1, id a2) {
        
        return [[(ALStudent *)a1 firstName] compare:[(ALStudent *)a2 firstName]];
        
    }];
    
    self.student = [NSMutableArray arrayWithArray:sortedObj];
    self.studentType = [NSArray arrayWithObjects:@"Good Student",@"Normal Student",@"Bad Student",@"Color", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray *)countOfStudentType:(ALStudentType)type {
    
    NSIndexSet *set = [self.student indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj averageMark] >= 10 && type == ALStudentGood) {
            return YES;
        } else if ([obj averageMark] <= 6 && type == ALStudentBad) {
            return YES;
        } else if (type == ALStudentNormal && [obj averageMark] > 6 && [obj averageMark] < 10) {
            return YES;
        }
        return NO;
    }];
    
    NSArray *arrayOfType = [self.student objectsAtIndexes:set];
    
    return arrayOfType;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.studentType objectAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.studentType count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == ALStudentGood) {
        return [[self countOfStudentType:ALStudentGood] count];
    } if (section == ALStudentNormal) {
        return [[self countOfStudentType:ALStudentNormal] count];
    } else if (section == ALStudentBad) {
        return [[self countOfStudentType:ALStudentBad] count];
    } else {
        return [self.arrayColor count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    static NSString *identifierColor = @"cellColor";
    
    UITableViewCell *cellColor = [tableView dequeueReusableCellWithIdentifier:identifierColor];
    
    if (indexPath.section == 3) {
        
        if (!cellColor) {
            cellColor = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierColor];
        }
        
    } else {
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
    }
    
    cell.textLabel.font = [UIFont fontWithName:nil size:12];
    cell.detailTextLabel.font = [UIFont fontWithName:nil size:12];
    
    
    if (indexPath.section == 3) {
        
        ALObject *obj = [self.arrayColor objectAtIndex:indexPath.row];
        cellColor.textLabel.text = obj.name;
        cellColor.backgroundColor = obj.color;
        cellColor.textLabel.font = [UIFont fontWithName:nil size:12];
        
        return cellColor;
        
    } else {
        
        
        NSArray *student = [self countOfStudentType:(ALStudentType)indexPath.section];
        
        
        ALStudent *studetObj = [student objectAtIndex:indexPath.row];
        
        if (studetObj.averageMark >= 10) {
            cell.backgroundColor = [UIColor greenColor];
        } else if (studetObj.averageMark <= 6) {
            cell.backgroundColor = [UIColor redColor];
        } else {
            cell.backgroundColor = [UIColor orangeColor];
        }
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%g",studetObj.averageMark];
        cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",studetObj.firstName ,studetObj.secondName];
        
        return cell;
    }
    
    return nil;
}



@end
