//
//  CustomTableViewCell.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "TransportLayer.h"
#import "Category.h"

@interface CustomTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) TransportLayer *transport;

@end

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.transport = [[TransportLayer alloc] init];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.image.image = nil;
}

- (void)configureWithCategory:(Category *)category {
    self.titleLabel.text = category.name;
    
    __weak typeof(self) weakself = self;
    [self.transport downloadFileWithURL:category.url completion:^(NSData *fileData, NSError *error) {
        __strong typeof(self) strongSelf = weakself;
        if (strongSelf) {
            if (error) {
                NSLog(@"%@", error);
            } else {
                strongSelf.image.image = [UIImage imageWithData:fileData];
            }
        }
    }];
}

@end
