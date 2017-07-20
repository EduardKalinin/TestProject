//
//  CustomTableViewCell.m
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "CustomAutoTableViewCell.h"

@implementation CustomAutoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.colorView.layer.cornerRadius = CGRectGetMidX(self.colorView.bounds);
    self.colorView.layer.masksToBounds = YES;
}

@end
