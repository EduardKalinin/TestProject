//
//  NavigationTableViewController.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "NavigationTableViewController.h"
#import "NavigationInCodeRootViewController.h"
#import "RootTabBatViewController.h"

@interface NavigationTableViewController ()

@end

@implementation NavigationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Actions

- (IBAction)actionGoButton:(UIButton *)sender {
    UIViewController *firstController = [[NavigationInCodeRootViewController alloc] init];
    [self.navigationController pushViewController:firstController animated:YES];
}

- (IBAction)actionGoTabButton:(UIButton *)sender {
    UITabBarController *firstBarController = [[RootTabBatViewController alloc] init];
    [self.navigationController pushViewController:firstBarController animated:YES];
}

@end
