//
//  ImageViewController.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "ImageViewController.h"
#import "CategoryService.h"
#import "UIAlertController+Utils.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak ImageViewController *weakself = self;
    NSURL *url = [NSURL URLWithString:@"http://images.firstcovers.com/covers/i/its_easy_if_you_try-5332.jpg"];
    
    [[CategoryService sharedInstance]
     getImageWithUrl:url
     completion:^(UIImage *image, NSError *error) {
         if (weakself) {
             if (error) {
                 [UIAlertController showFromViewController:weakself
                                                     title:@"ERROR"
                                                   message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
             } else {
                 weakself.imageView.image = image;
             }
         }
     }];
}

@end
