//
//  CustomCollectionViewCell.h
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface CustomCollectionViewCell : UICollectionViewCell

- (void)configureWithPhoto:(Photo *)photo;

@end
