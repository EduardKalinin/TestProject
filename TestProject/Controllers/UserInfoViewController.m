//
//  UserInfoViewController.m
//  TestProject
//
//  Created by Developer on 7/13/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *sexTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Title";
    [self configureButtonWithPhoneTextField];
    [self configureButtonWithZipTextField];
}

#pragma mark - Helpers

- (void)configureButtonWithPhoneTextField {
    UIToolbar *keyboardNextButtonView = [[UIToolbar alloc] init];
    [keyboardNextButtonView sizeToFit];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(nextClicked:)];
    
    UIBarButtonItem *leftSpaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [keyboardNextButtonView setItems:[NSArray arrayWithObjects:leftSpaceButton, nextButton, nil]];
    self.phoneTextField.inputAccessoryView = keyboardNextButtonView;
}

- (void)configureButtonWithZipTextField {
    UIToolbar *keyboardNextButtonView = [[UIToolbar alloc] init];
    [keyboardNextButtonView sizeToFit];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                   style:UIBarButtonItemStylePlain target:self
                                                                  action:@selector(nextClickedWithZip:)];
    
    UIBarButtonItem *leftSpaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [keyboardNextButtonView setItems:[NSArray arrayWithObjects:leftSpaceButton, nextButton, nil]];
    self.zipTextField.inputAccessoryView = keyboardNextButtonView;
}


#pragma mark - Actions

- (IBAction)nextClicked:(id)sender {
    if (self.phoneTextField) {
        [self.addressTextField becomeFirstResponder];
    }
}

- (IBAction)nextClickedWithZip:(id)sender {
    if (self.zipTextField) {
        [self.emailTextField becomeFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([textField isEqual:self.phoneTextField] || [textField isEqual:self.zipTextField]) {
        NSCharacterSet *numbersOnly = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:textField.text];
        
        BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
        return stringIsValid;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.nameTextField]) {
        [self.sexTextField becomeFirstResponder];
    } else if ([textField isEqual:self.sexTextField]) {
        [self.phoneTextField becomeFirstResponder];
    } else if ([textField isEqual:self.addressTextField]) {
        [self.zipTextField becomeFirstResponder];
    } else if ([textField isEqual:self.emailTextField]) {
        [self.passwordTextField becomeFirstResponder];
    } else if ([textField isEqual:self.passwordTextField]) {
        [self.passwordTextField resignFirstResponder];
    }
    return YES;
}

@end
