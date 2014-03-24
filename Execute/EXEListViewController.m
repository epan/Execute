//
//  EXEListViewController.m
//  Execute
//
//  Created by Eric Pan on 3/23/14.
//  Copyright (c) 2014 Eric Pan. All rights reserved.
//

#import "EXEListViewController.h"

@interface EXEListViewController ()

@property (nonatomic) NSMutableArray *tasks;

@end

@implementation EXEListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Execute";
//    For reusing cells
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    Initializes tasks array
    self.tasks = [[NSMutableArray alloc] init];
    [self.tasks addObject:@"Mow the lawn"];
    [self.tasks addObject:@"Get haircut"];
    [self.tasks addObject:@"Call mom"];
}


// Sets number of rows the the number of tasks
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}


// Creates cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.tasks[indexPath.row];
    
    return cell;
}

@end

