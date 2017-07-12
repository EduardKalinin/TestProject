//
//  ImageViewController.m
//  TestProject
//
//  Created by Developer on 7/11/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "ImageViewController.h"
#import "TransportLayer.h"
#import "UIAlertController+Utils.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) TransportLayer *transport;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak ImageViewController *weakself = self;
    self.transport = [[TransportLayer alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://images.firstcovers.com/covers/i/its_easy_if_you_try-5332.jpg"];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        __strong ImageViewController *strongSelf = weakself;
        if (strongSelf) {
            if (error) {
                [UIAlertController showFromViewController:strongSelf
                                                    title:@"ERROR"
                                                  message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
            } else {
                UIImage *image = [UIImage imageWithData:fileData];
                strongSelf.imageView.image = image;
            }
        }
    }];
}

@end
