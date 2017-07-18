//
//  RootTabBatViewController.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "RootTabBatViewController.h"

@interface RootTabBatViewController ()

@end

@implementation RootTabBatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController *view1 = [[UIViewController alloc] init];
    UIViewController *view2 = [[UIViewController alloc] init];
    UIViewController *view3 = [[UIViewController alloc] init];
    
    [self setView:view1 color:[UIColor redColor]];
    [self setView:view2 color:[UIColor greenColor]];
    [self setView:view3 color:[UIColor orangeColor]];

    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:view1];
    [tabViewControllers addObject:view2];
    [tabViewControllers addObject:view3];
    
    [self setViewControllers:tabViewControllers];
    
    view1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"view1" image:nil tag:1];
    view2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"view2" image:nil tag:2];
    view3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"view3" image:nil tag:3];
}

- (void)setView:(UIViewController *)view color:(UIColor *)color{
    UIView *someView = [[UIView alloc] initWithFrame:CGRectMake(50.0, 250.0, 50.0, 50.0)];
    someView.backgroundColor = color;
    [view.view addSubview:someView];
}

@end
