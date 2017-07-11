//
//  ViewController.m
//  TestProject
//
//  Created by Developer on 7/10/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "ViewController.h"
#import "TransportLayer.h"
#import "UIAlertController+Utils.h"

@interface ViewController ()

@property (strong, nonatomic) TransportLayer *transport;

@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdButton;
@property (weak, nonatomic) IBOutlet UIButton *fourthButton;
@property (weak, nonatomic) IBOutlet UIButton *fifthButton;
@property (weak, nonatomic) IBOutlet UIButton *sixthButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transport = [[TransportLayer alloc] init];
    
}

#pragma mark - Actions

- (IBAction)actionFirstButtonClicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://download.thinkbroadband.com/5MB.zip"];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        
        if (error) {
            [UIAlertController showFromViewController:self
                                                title:@"ERROR"
                                              message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
        }else {
            [UIAlertController showFromViewController:self
                                                title:@"Download Complete"
                                              message:[NSString stringWithFormat:@"Size = %lu", fileData.length]];
        }
    }];
}

- (IBAction)actionSecondButtonClicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://download.thinkbroadband.com/10MB.zip"];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        
        if (error) {
            [UIAlertController showFromViewController:self
                                                title:@"ERROR"
                                              message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
        }else {
            [UIAlertController showFromViewController:self
                                                title:@"Download Complete"
                                              message:[NSString stringWithFormat:@"Size = %lu", fileData.length]];
        }
    }];
}

- (IBAction)actionThirdButtonClicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://download.thinkbroadband.com/20MB.zip"];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        
        if (error) {
            [UIAlertController showFromViewController:self
                                                title:@"ERROR"
                                              message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
        }else {
            [UIAlertController showFromViewController:self
                                                title:@"Download Complete"
                                              message:[NSString stringWithFormat:@"Size = %lu", fileData.length]];
        }
    }];
}

- (IBAction)actionFourthButtonClicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://download.thinkbroadband.com/50MB.zip"];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        
        if (error) {
            [UIAlertController showFromViewController:self
                                                title:@"ERROR"
                                              message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
        }else {
            [UIAlertController showFromViewController:self
                                                title:@"Download Complete"
                                              message:[NSString stringWithFormat:@"Size = %lu", fileData.length]];
        }
    }];
}

- (IBAction)actionFifthButtonClicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://download.thinkbroadband.com/100MB.zip"];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        
        if (error) {
            [UIAlertController showFromViewController:self
                                                title:@"ERROR"
                                              message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
        }else {
            [UIAlertController showFromViewController:self
                                                title:@"Download Complete"
                                              message:[NSString stringWithFormat:@"Size = %lu", fileData.length]];
        }
    }];
}

- (IBAction)actionSixthButtonClicked:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://download.thinkbroadband.com/200MB.zip"];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        
        if (error) {
            [UIAlertController showFromViewController:self
                                                title:@"ERROR"
                                              message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
        }else {
            [UIAlertController showFromViewController:self
                                                title:@"Download Complete"
                                              message:[NSString stringWithFormat:@"Size = %lu", fileData.length]];
        }
    }];
}

@end
