//
//  AutoViewController.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "AutoViewController.h"
#import "Model.h"
#import "CustomAutoTableViewCell.h"

typedef NS_ENUM(NSUInteger, SortCriteria) {
    BrandAZ,
    BrandZA,
    ModelAZ,
    ModelZA,
    YearInAscendingOrder,
    YearInDescendingOrder
};

@interface AutoViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSArray *sortedArray;
@property (strong, nonatomic) NSArray *sortCriteriasArray;

@end

@implementation AutoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureLayout];
}

#pragma mark - Helpers

- (void)configureLayout {
    [self prepareData];
    
    self.sortCriteriasArray = @[@"Brand A-Z",
                                @"Brand Z-A",
                                @"Model A-Z",
                                @"Model Z-A",
                                @"Year in ascending order",
                                @"Year in descending order"];
    
    [self addBarButtonItem];
    
    [self sortByCriteria:BrandAZ];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy";
}

- (void)prepareData {
    self.items = [NSMutableArray array];
    
    for (int i = 0; i < 50; i++) {
        [self.items addObject:[Model randomModel]];
    }
}

- (void)sortByCriteria:(SortCriteria)criteria {
    NSSortDescriptor *sortDescr1;
    NSSortDescriptor *sortDescr2;
    NSSortDescriptor *sortDescr3;
    
    if (criteria == BrandAZ || criteria == BrandZA) {
        sortDescr1 = [[NSSortDescriptor alloc] initWithKey:@"brand" ascending:criteria == BrandAZ];
        sortDescr2 = [[NSSortDescriptor alloc] initWithKey:@"model" ascending:YES];
        sortDescr3 = [[NSSortDescriptor alloc] initWithKey:@"year" ascending:YES];
    } else if (criteria == ModelAZ || criteria == ModelZA) {
        sortDescr1 = [[NSSortDescriptor alloc] initWithKey:@"model" ascending:criteria == ModelAZ];
        sortDescr2 = [[NSSortDescriptor alloc] initWithKey:@"brand" ascending:YES];
        sortDescr3 = [[NSSortDescriptor alloc] initWithKey:@"year" ascending:YES];
    } else if (criteria == YearInAscendingOrder || criteria == YearInDescendingOrder) {
        sortDescr1 = [[NSSortDescriptor alloc] initWithKey:@"year" ascending:criteria == YearInAscendingOrder];
        sortDescr2 = [[NSSortDescriptor alloc] initWithKey:@"brand" ascending:YES];
        sortDescr3 = [[NSSortDescriptor alloc] initWithKey:@"model" ascending:YES];
    }
    
    NSArray *sortDescriptors = @[sortDescr1, sortDescr2, sortDescr3];
    self.sortedArray = [self.items sortedArrayUsingDescriptors:sortDescriptors];
}

- (void)addBarButtonItem {
    UIBarButtonItem *sortButton = [[UIBarButtonItem alloc] initWithTitle:@"Sort" style:UIBarButtonItemStylePlain target:self action:@selector(actionSortBarButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem = sortButton;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sortedArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomAutoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomAutoTableViewCell class])];
    
    Model *model = [self.sortedArray objectAtIndex:indexPath.row];
    cell.brandLabel.text = [NSString stringWithFormat:@"%@", model.brand];
    cell.modelLabel.text = [NSString stringWithFormat:@"%@", model.model];
    cell.yearLabel.text = [self.dateFormatter stringFromDate:model.year];
    cell.colorView.backgroundColor = model.color;
    
    return cell;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    [self.searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:
                                    @"brand CONTAINS[cd] %@ OR "
                                    "model CONTAINS[cd] %@ OR"
                                    "year == %ld",
                                    searchText, searchText, searchText];
    
    self.sortedArray = [self.items filteredArrayUsingPredicate:searchPredicate];
    [self.tableView reloadData];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.sortCriteriasArray.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.sortCriteriasArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *pickedString = self.sortCriteriasArray[row];
    
    if ([pickedString isEqual:@"Brand A-Z"]) {
        [self sortByCriteria:BrandAZ];
    } else if ([pickedString isEqual:@"Brand Z-A"]) {
        [self sortByCriteria:BrandZA];
    } else if ([pickedString isEqual:@"Model A-Z"]) {
        [self sortByCriteria:ModelAZ];
    } else if ([pickedString isEqual:@"Model Z-A"]) {
        [self sortByCriteria:ModelZA];
    } else if ([pickedString isEqual:@"Year in ascending order"]) {
        [self sortByCriteria:YearInAscendingOrder];
    } else if ([pickedString isEqual:@"Year in descending order"]) {
        [self sortByCriteria:YearInDescendingOrder];
    }
    
    [pickerView removeFromSuperview];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (void)actionSortBarButtonClicked:(UIBarButtonItem *)sender {
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    CGSize viewSize = self.view.bounds.size;
    CGFloat pickerHeight = CGRectGetHeight(pickerView.bounds);
    pickerView.frame = (CGRect) {
        0.0,
        viewSize.height - pickerHeight,
        viewSize.width,
        pickerHeight
    };
    
    [self.view addSubview:pickerView];
}

@end
