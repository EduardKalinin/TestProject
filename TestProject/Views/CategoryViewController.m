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
#import "TransportLayer.h"
#import "UIAlertController+Utils.h"

@interface CategoryViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) CategoryService *categoryService;
@property (strong, nonatomic) TransportLayer *transport;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transport = [[TransportLayer alloc] init];
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

    Category *category = [self.items objectAtIndex:indexPath.row];
    cell.titleLabel.text = category.name;
    
    __weak CategoryViewController *weakself = self;
    [self.transport downloadFileWithURL:category.url completion:^(NSData *fileData, NSError *error) {
        __strong CategoryViewController *strongSelf = weakself;
        if (strongSelf) {
            if (error) {
                [UIAlertController showFromViewController:strongSelf
                                                    title:@"ERROR"
                                                  message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
            } else {
                UIImage *image = [UIImage imageWithData:fileData];
                cell.image.image = image;
                
            }
        }
    }];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
