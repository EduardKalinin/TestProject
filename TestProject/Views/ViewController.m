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


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transport = [[TransportLayer alloc] init];
    
}

- (void)loadFileWithURLString:(NSString *)urlString {
    __weak ViewController *weakself = self;
    NSURL *url = [NSURL URLWithString:urlString];
    [self.transport downloadFileWithURL:url completion:^(NSData *fileData, NSError *error) {
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

- (IBAction)actionFirstButtonClicked:(id)sender {
    [self loadFileWithURLString:fiveMb];
}

- (IBAction)actionSecondButtonClicked:(id)sender {
    [self loadFileWithURLString:tenMb];
}

- (IBAction)actionThirdButtonClicked:(id)sender {
    [self loadFileWithURLString:twentyMb];
}

- (IBAction)actionFourthButtonClicked:(id)sender {
    [self loadFileWithURLString:fiftyMb];
}

- (IBAction)actionFifthButtonClicked:(id)sender {
    [self loadFileWithURLString:hundredMb];
}

- (IBAction)actionSixthButtonClicked:(id)sender {
    [self loadFileWithURLString:twoHundredMb];
}

- (IBAction)actionFiveMbButtonClicked:(id)sender {
    [self loadFileWithURLString:fiveMb];
}

- (IBAction)actionTenMbButtonClicked:(id)sender {
    [self loadFileWithURLString:tenMb];
}

- (IBAction)actionTwentyMbButtonClicked:(id)sender {
    [self loadFileWithURLString:twentyMb];
}

- (IBAction)actionFiftyMbButtonClicked:(id)sender {
    [self loadFileWithURLString:fiftyMb];
}

- (IBAction)actionHundredMbButtonClicked:(id)sender {
    [self loadFileWithURLString:hundredMb];
}

@end
