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
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@end

@implementation NewDownloadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureLayout];
    self.transport = [[NewTransportLayer alloc] init];
}

#pragma mark - Helpers

- (void)configureLayout {
    self.pauseButton.hidden = YES;
    self.stopButton.hidden = YES;
}

#pragma mark - Actions

- (IBAction)actionStartButtonClicked:(id)sender {
    [self.progressView setProgress:0.0];
    self.startButton.enabled = NO;
    self.stopButton.enabled = YES;
    self.pauseButton.hidden = NO;
    self.pauseButton.selected = NO;
    self.stopButton.hidden = NO;
    __weak NewDownloadViewController *weakself = self;
    [self.transport downloadFileWithURL:[NSURL URLWithString:@"http://download.thinkbroadband.com/10MB.zip"]
                                success:^{
                                    __strong NewDownloadViewController *strongSelf = weakself;
                                    [strongSelf configureLayout];
                                    self.startButton.enabled = YES;
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
                                    __strong NewDownloadViewController *strongSelf = weakself;
                                    if (strongSelf) {
                                        [self.progressView setProgress:progress animated:YES];
                                    }
                                }];
    
}

- (IBAction)actionStopButtonClicked:(id)sender {
    self.stopButton.enabled = NO;
    self.startButton.enabled = YES;
    [self.transport cancelDownload];
    [self.progressView setProgress:0.0 animated:YES];
    self.pauseButton.hidden = YES;
    self.stopButton.hidden = YES;
}

- (IBAction)actionPauseButtonClicked:(id)sender {
    if (self.pauseButton.selected) {
        [self.transport resumeDownload];
        self.pauseButton.selected = NO;
    } else {
        [self.transport suspendDownload];
        self.pauseButton.selected = YES;
    }
}

@end
