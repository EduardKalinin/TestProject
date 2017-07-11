//
//  UIAlertController+Utils.h
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 04.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Utils)

+ (void)showFromViewController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message;

@end
