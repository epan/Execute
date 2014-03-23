//
//  EXEAppDelegate.m
//  Execute
//
//  Created by Eric Pan on 3/22/14.
//  Copyright (c) 2014 Eric Pan. All rights reserved.
//

#import "EXEAppDelegate.h"
#import "EXEPlayViewController.h"

@implementation EXEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[EXEPlayViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
