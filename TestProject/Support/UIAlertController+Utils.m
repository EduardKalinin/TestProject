//
//  UIAlertController+Utils.m
//  JSONPlaceholder
//
//  Created by Eduard Kalinin on 04.05.17.
//  Copyright (c) 2017 Eduard Kalinin. All rights reserved.
//

#import "UIAlertController+Utils.h"

@implementation UIAlertController (Utils)

+ (void)showFromViewController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title
                                                                   message: message
                                                            preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action) {
                                                         }];
    [alert addAction:actionCancel];
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end
