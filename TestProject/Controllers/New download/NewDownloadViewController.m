//
//  NewDownloadViewController.m
//  TestProject
//
//  Created by Developer on 7/30/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "NewDownloadViewController.h"
#import "NewTransportLayer.h"
#import "UIAlertController+Utils.h"

@interface NewDownloadViewController ()

@property (strong, nonatomic) NewTransportLayer *transport;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation NewDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transport = [[NewTransportLayer alloc] init];
}

#pragma mark - Actions

- (IBAction)actionStartButtonClicked:(id)sender {
    __weak NewDownloadViewController *weakself = self;
    [self.transport downloadFileWithURL:[NSURL URLWithString:@"http://download.thinkbroadband.com/5MB.zip"]
                                success:^{
                                    __strong NewDownloadViewController *strongSelf = weakself;
                                    if (strongSelf) {
                                        [UIAlertController showFromViewController:strongSelf
                                                                            title:@"Download Complete"
                                                                          message:@"Yoohooo"];
                                    }
                                } failure:^(NSError *error) {
                                    __strong NewDownloadViewController *strongSelf = weakself;
                                    if (strongSelf) {
                                        [UIAlertController showFromViewController:strongSelf
                                                                            title:@"ERROR"
                                                                          message:@"error"];
                                    }
                                } progress:^(CGFloat progress) {
                                    [self.progressView setProgress:progress animated:YES];
                                }];
}

- (IBAction)actionStopButtonClicked:(id)sender {
    
}

@end
