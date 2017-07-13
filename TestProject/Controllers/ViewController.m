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

NSString *const fiveMb = @"http://download.thinkbroadband.com/5MB.zip";
NSString *const tenMb = @"http://download.thinkbroadband.com/10MB.zip";
NSString *const twentyMb = @"http://download.thinkbroadband.com/20MB.zip";
NSString *const fiftyMb = @"http://download.thinkbroadband.com/50MB.zip";
NSString *const hundredMb = @"http://download.thinkbroadband.com/100MB.zip";
NSString *const twoHundredMb = @"http://download.thinkbroadband.com/200MB.zip";

@interface ViewController ()

@property (strong, nonatomic) TransportLayer *transport;

@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdButton;
@property (weak, nonatomic) IBOutlet UIButton *fourthButton;
@property (weak, nonatomic) IBOutlet UIButton *fifthButton;
@property (weak, nonatomic) IBOutlet UIButton *sixthButton;
@property (weak, nonatomic) IBOutlet UIButton *fiveMbButton;
@property (weak, nonatomic) IBOutlet UIButton *tenMbButton;
@property (weak, nonatomic) IBOutlet UIButton *twentyMbButton;
@property (weak, nonatomic) IBOutlet UIButton *fiftyMbButton;
@property (weak, nonatomic) IBOutlet UIButton *hundredMbButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transport = [[TransportLayer alloc] init];
    
}

- (void)loadFileWithURLString:(NSString *)urlString {
    __weak ViewController *weakself = self;
    [self.activityIndicator startAnimating];
    NSURL *url = [NSURL URLWithString:urlString];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
        [weakself.activityIndicator stopAnimating];
        __strong ViewController *strongSelf = weakself;
        if (strongSelf) {
            if (error) {
                [UIAlertController showFromViewController:strongSelf
                                                    title:@"ERROR"
                                                  message:[NSString stringWithFormat:@"%@", error.localizedDescription]];
            } else {
                [UIAlertController showFromViewController:strongSelf
                                                    title:@"Download Complete"
                                                  message:[NSString stringWithFormat:@"Size = %lu", fileData.length]];
            }
        }
    }];
}

#pragma mark - Actions

- (IBAction)actionFirstButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:fiveMb];
    
}

- (IBAction)actionSecondButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:tenMb];
}

- (IBAction)actionThirdButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:twentyMb];
}

- (IBAction)actionFourthButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:fiftyMb];
}

- (IBAction)actionFifthButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:hundredMb];
}

- (IBAction)actionSixthButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:twoHundredMb];
}

- (IBAction)actionFiveMbButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:fiveMb];
}

- (IBAction)actionTenMbButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:tenMb];
}

- (IBAction)actionTwentyMbButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:twentyMb];
}

- (IBAction)actionFiftyMbButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:fiftyMb];
}

- (IBAction)actionHundredMbButtonClicked:(UIButton *)sender {
    [self loadFileWithURLString:hundredMb];
}

@end
