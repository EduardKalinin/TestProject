//
//  NavigationInCodeRootViewController.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "NavigationInCodeRootViewController.h"
#import "PRESENTViewController.h"

@interface NavigationInCodeRootViewController ()

@end

@implementation NavigationInCodeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(100.0, 200.0, 100.0, 50.0);
    [button1 setTitle:@"PUSH" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(actionPUSHButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(100.0, 300.0, 100.0, 50.0);
    [button2 setTitle:@"PRESENT" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(actionPRESENTButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

#pragma mark - Actions

- (void)actionPUSHButtonClicked:(UIButton *)sender {
    UIViewController *pushVC = [[UIViewController alloc] init];
    pushVC.view.backgroundColor = [UIColor whiteColor];
    
    UIView *someView = [[UIView alloc] initWithFrame:CGRectMake(50.0, 250.0, 50.0, 50.0)];
    someView.backgroundColor = [UIColor redColor];
    [pushVC.view addSubview:someView];
    
    [self.navigationController showViewController:pushVC sender:self];
}

- (void)actionPRESENTButtonClicked:(UIButton *)sender {
    UIViewController *presentVC = [[PRESENTViewController alloc] init];
    presentVC.view.backgroundColor = [UIColor whiteColor];
    
    UIView *someView = [[UIView alloc] initWithFrame:CGRectMake(50.0, 250.0, 50.0, 50.0)];
    someView.backgroundColor = [UIColor greenColor];
    [presentVC.view addSubview:someView];
    
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:presentVC];
    
    [self.navigationController presentViewController:navVC animated:YES completion:nil];
}

@end
