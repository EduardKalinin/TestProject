//
//  PhotoViewController.m
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "PhotoViewController.h"
#import "CustomCollectionViewCell.h"
#import "PhotosService.h"
#import "Photo.h"

@interface PhotoViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *colectionView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) PhotosService *photoService;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoService = [[PhotosService alloc] init];
    
    self.items = self.cat.photos;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CustomCollectionViewCell class]) forIndexPath:indexPath];
    
    Photo *photo = [self.items objectAtIndex:indexPath.row];
    [cell configureWithPhoto:photo];
    
    return cell;
}

@end
