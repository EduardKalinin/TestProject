//
//  CustomTableViewCell.h
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"

@interface CustomTableViewCell : UITableViewCell

- (void)configureWithCategory:(Category *)category;

@end
