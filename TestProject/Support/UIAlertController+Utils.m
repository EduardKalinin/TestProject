//
//  Category.h
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
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
