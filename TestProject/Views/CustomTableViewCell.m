//
//  CustomTableViewCell.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "Category.h"
#import "CategoryService.h"

@interface CustomTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.image.image = nil;
}

- (void)configureWithCategory:(Category *)category {
    self.titleLabel.text = category.name;
    
    __weak typeof(self) weakself = self;
    
    [[CategoryService sharedInstance] getImageWithUrl:category.url completion:^(UIImage *image, NSError *error) {
        if (weakself) {
            if (error) {
                NSLog(@"%@", error);
            } else {
                weakself.image.image = image;
            }
        }
    }];
}

@end
