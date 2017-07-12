//
//  CategoryViewController.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CategoryViewController.h"
#import "Category.h"
#import "CategoryService.h"
#import "CustomTableViewCell.h"
#import "UIAlertController+Utils.h"
#import "PhotoViewController.h"
#import "Photo.h"

@interface CategoryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) CategoryService *categoryService;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Category";
    self.categoryService = [[CategoryService alloc] init];
    [self loadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = NSStringFromClass([CustomTableViewCell class]);
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Category *category = self.items[indexPath.row];
    [cell configureWithCategory:category];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    Category *selectedCategory = self.items[indexPath.row];
    PhotoViewController *photoVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PhotoViewController class])];
    photoVC.cat = selectedCategory;
    [self.navigationController pushViewController:photoVC animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat tableHeight = CGRectGetHeight(tableView.bounds) - fabs(tableView.contentOffset.y);
    return tableHeight/self.items.count;
}

#pragma mark - Load Data

- (void)loadData {
    __weak CategoryViewController *weakSelf = self;
    [self.categoryService getObjectsWithCompletion:^(NSArray *items, NSError *error) {
        weakSelf.items = items;
        [weakSelf.tableView reloadData];
    }];
}

@end
