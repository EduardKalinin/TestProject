//
//  NewUserInfoTableViewController.m
//  TestProject
//
//  Created by Developer on 7/14/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "NewUserInfoTableViewController.h"

@interface NewUserInfoTableViewController () <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *zipLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *sexTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation NewUserInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureLayout];
    
}

#pragma mark - Helpers

- (void)configureLayout {
    [self configureNextButtonWithTextField:self.sexTextField selector:@selector(nextClickedWithSex:)];
    [self configurePickerView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)];
    [self.view addGestureRecognizer:tap];
}

- (void)configurePickerView {
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    self.sexTextField.inputView = pickerView;
}

- (void)configureNextButtonWithTextField:(UITextField *)textField selector:(SEL)selector {
    UIToolbar *keyboardNextButtonView = [[UIToolbar alloc] init];
    [keyboardNextButtonView sizeToFit];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:selector];
    
    UIBarButtonItem *leftSpaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [keyboardNextButtonView setItems:@[leftSpaceButton, nextButton]];
    textField.inputAccessoryView = keyboardNextButtonView;
}

#pragma mark - Actions

- (void)nextClickedWithSex:(UIBarButtonItem *)sender {
    if (self.zipTextField) {
        [self.phoneTextField becomeFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.fullNameTextField]) {
        [self.sexTextField becomeFirstResponder];
    } else if ([textField isEqual:self.phoneTextField]) {
        [self.addressTextField becomeFirstResponder];
    } else if ([textField isEqual:self.addressTextField]) {
        [self.zipTextField becomeFirstResponder];
    } else if ([textField isEqual:self.zipTextField]) {
        [self.emailTextField becomeFirstResponder];
    } else if ([textField isEqual:self.emailTextField]) {
        [self.passwordTextField becomeFirstResponder];
    } else if ([textField isEqual:self.passwordTextField]) {
        [self.passwordTextField resignFirstResponder];
    }
    return YES;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @[@"Male", @"Female", @"Not Sharing"][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.sexTextField.text = @[@"Male", @"Female", @"Not Sharing"][row];
}

@end
