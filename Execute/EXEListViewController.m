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

@property (nonatomic) NSMutableArray *completedTasks;

@end

@implementation EXEListViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    For reusing cells
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    Adds text field
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 260.f, 32.0f)];
    textField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    textField.returnKeyType = UIReturnKeyGo;
    textField.placeholder = @"What do you want to execute?";
    textField.delegate = self;
    self.navigationItem.titleView = textField;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"✏️" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEdit:)];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
//    Initializes tasks array
    NSArray *loadedTasks = [userDefaults arrayForKey:@"tasks"];
    self.tasks = [[NSMutableArray alloc] initWithArray:loadedTasks];
    
    loadedTasks = [userDefaults arrayForKey:@"completedTasks"];
    self.completedTasks = [[NSMutableArray alloc] initWithArray:loadedTasks];

}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    if (editing) {
        self.navigationItem.rightBarButtonItem.title = @"👍";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"✏️";
    }
}


#pragma mark - Actions

- (void)toggleEdit:(id)sender {
    [self setEditing:!self.editing animated:YES];
}


#pragma mark - Private

//    Saves contents even when the app quits
- (void)save {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.tasks forKey:@"tasks"];
    [userDefaults setObject:self.completedTasks forKey:@"completedTasks"];
    [userDefaults synchronize];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

// Sets number of rows the the number of tasks
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return [self.completedTasks count];
    }
    return [self.tasks count];
}

// Creates cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    if (indexPath.section == 0) {
        cell.textLabel.text = self.tasks[indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
    } else {
        cell.textLabel.text = self.completedTasks[indexPath.row];
        cell.textLabel.textColor = [UIColor lightGrayColor];
    }
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [tableView beginUpdates];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];

    if (indexPath.section == 0) {
        //    Tapped an uncompleted task. Time to complete it!
        //    Saves the row to the variable before removing it
        NSString *task = self.tasks[indexPath.row];
        
        [self.tasks removeObjectAtIndex:indexPath.row];
        
        //    Adds to the completed tasks
        [self.completedTasks insertObject:task atIndex:0];
        
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationTop];
    } else {
        //    Tapped an completed task. Time to uncomplete it!
        NSString *task = self.completedTasks[indexPath.row];
        [self.completedTasks removeObjectAtIndex:indexPath.row];
        [self.tasks insertObject:task atIndex:0];
    
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    }
    
    [tableView endUpdates];
    
    [self save];
}


#pragma mark - UITextFieldDelegate

// This will be called whenever you press Return
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.tasks insertObject:textField.text atIndex:0];
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
    
    textField.text = nil;
    
    [self save];
    
    return NO;
}

@end

