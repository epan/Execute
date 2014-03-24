//
//  EXEListViewController.m
//  Execute
//
//  Created by Eric Pan on 3/23/14.
//  Copyright (c) 2014 Eric Pan. All rights reserved.
//

#import "EXEListViewController.h"

@interface EXEListViewController () <UITextFieldDelegate>

@property (nonatomic) NSMutableArray *tasks;

@end

@implementation EXEListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    For reusing cells
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    Adds text field
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 280.f, 32.0f)];
    textField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    textField.returnKeyType = UIReturnKeyGo;
    textField.placeholder = @"What do you want to execute?";
    textField.delegate = self;
    self.navigationItem.titleView = textField;
    
//    Initializes tasks array
    self.tasks = [[NSMutableArray alloc] init];
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

// This will be called whenever you press Return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.tasks insertObject:textField.text atIndex:0];
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
    
    textField.text = nil;
    
    return NO;
}

@end

