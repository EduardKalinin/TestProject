//
//  CustomTableViewCell.h
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAutoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

@end
