//
//  NavigationTableViewController.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "NavigationTableViewController.h"
#import "NavigationInCodeRootViewController.h"

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

@end
