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
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 40.0f, 280.0f, 44.0f)];
    textField.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0f];
    textField.delegate = self;
    [self.view addSubview:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Text: %@", textField.text);
    return NO;
}

@end
