//
//  PhotoViewController.m
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "PhotoViewController.h"
#import "CustomCollectionViewCell.h"
#import "Photo.h"
#import "Category.h"

@interface PhotoViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *colectionView;
@property (strong, nonatomic) NSArray *items;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = self.cat.photos;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomCollectionViewCell class]) forIndexPath:indexPath];
    
    Photo *photo = self.items[indexPath.row];
    [cell configureWithPhoto:photo];
    
    return cell;
}

@end
