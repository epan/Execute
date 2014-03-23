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
    [self.view addSubview:label];
}

@end
