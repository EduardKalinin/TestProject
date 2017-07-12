//
//  CustomCollectionViewCell.h
//  TestProject
//
//  Created by Developer on 7/12/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Photo;

@interface CustomCollectionViewCell : UICollectionViewCell

- (void)configureWithPhoto:(Photo *)photo;

@end
