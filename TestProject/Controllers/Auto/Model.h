//
//  Model.h
//  TestProject
//
//  Created by Developer on 7/18/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Model : NSObject

@property (strong, nonatomic) NSString *brand;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSDate *year;
@property (strong, nonatomic) UIColor *color;

+ (Model *)randomModel;

@end
