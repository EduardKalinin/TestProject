//
//  PRESENTViewController.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "PRESENTViewController.h"

@interface PRESENTViewController ()

@end

@implementation PRESENTViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addBarButtonItem];
}

- (void)addBarButtonItem {
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(actionCancelBarButtonClicked:)];

    self.navigationItem.rightBarButtonItem = cancelButton;
}

#pragma mark - Actions

- (void)actionCancelBarButtonClicked:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
