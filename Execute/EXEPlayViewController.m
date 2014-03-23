//
//  EXEPlayViewController.m
//  Execute
//
//  Created by Eric Pan on 3/22/14.
//  Copyright (c) 2014 Eric Pan. All rights reserved.
//

#import "EXEPlayViewController.h"

@implementation EXEPlayViewController

- (void)viewDidLoad {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 40.0f, 280.0f, 44.0f)];
    label.text = @"Hello world";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20.0f, 100.0f, 280.0f, 44.0f)];
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
}

@end
