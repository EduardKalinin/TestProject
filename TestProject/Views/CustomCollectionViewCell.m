//
//  CustomCollectionViewCell.m
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "TransportLayer.h"
#import "Photo.h"

@interface CustomCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) TransportLayer *transport;

@end

@implementation CustomCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.transport = [[TransportLayer alloc] init];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.image.image = nil;
}

- (void)configureWithPhoto:(Photo *)photo {
    self.titleLabel.text = photo.name;
    
    __weak typeof(self) weakself = self;
    [self.transport downloadFileWithURL:photo.url completion:^(NSData *fileData, NSError *error) {
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
