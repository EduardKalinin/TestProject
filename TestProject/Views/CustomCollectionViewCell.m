//
//  CustomCollectionViewCell.m
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "Photo.h"
#import "CategoryService.h"

@interface CustomCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CustomCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.image.image = nil;
}

- (void)configureWithPhoto:(Photo *)photo {
    self.titleLabel.text = photo.name;
    
    __weak typeof(self) weakself = self;
    
    [[CategoryService sharedInstance] getImageWithUrl:photo.url completion:^(UIImage *image, NSError *error) {
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
