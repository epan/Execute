//
//  EXEListViewController.m
//  Execute
//
//  Created by Eric Pan on 3/23/14.
//  Copyright (c) 2014 Eric Pan. All rights reserved.
//

#import "EXEListViewController.h"

@interface EXEListViewController ()

@end

@implementation EXEListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Execute";
}

// Sets 3 of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

// Creates cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = @"Say hi!";
    return cell;
}

@end

