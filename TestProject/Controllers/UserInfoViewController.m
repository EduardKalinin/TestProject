//
//  UserInfoViewController.m
//  TestProject
//
//  Created by Developer on 7/13/17.
//  Copyright © 2017 Developer. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *sexTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollViewBottomLayout;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Title";
    [self configureLayout];
}

#pragma mark - Helpers

- (void)configureLayout {
    [self configureNextButtonWithTextField:self.sexTextField selector:@selector(nextClickedWithSex:)];
    [self configureNextButtonWithTextField:self.phoneTextField selector:@selector(nextClickedWithPhone:)];
    [self configureNextButtonWithTextField:self.zipTextField selector:@selector(nextClickedWithZip:)];
    [self signWithNotification];
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

- (IBAction)nextClickedWithPhone:(id)sender {
    if (self.phoneTextField) {
        [self.addressTextField becomeFirstResponder];
    }
}

- (IBAction)nextClickedWithZip:(id)sender {
    if (self.zipTextField) {
        [self.emailTextField becomeFirstResponder];
    }
}

- (IBAction)nextClickedWithSex:(id)sender {
    if (self.zipTextField) {
        [self.phoneTextField becomeFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([textField isEqual:self.zipTextField] && text.length > 6) {
        return NO;
    }
    
    if ([textField isEqual:self.phoneTextField] || [textField isEqual:self.zipTextField]) {
        NSCharacterSet *numbersOnly = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString:text];
        
        BOOL stringIsValid = [numbersOnly isSupersetOfSet:characterSetFromTextField];
        return stringIsValid;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.nameTextField]) {
        [self.sexTextField becomeFirstResponder];
    } else if ([textField isEqual:self.addressTextField]) {
        [self.zipTextField becomeFirstResponder];
    } else if ([textField isEqual:self.emailTextField]) {
        [self.passwordTextField becomeFirstResponder];
    } else if ([textField isEqual:self.passwordTextField]) {
        [self.passwordTextField resignFirstResponder];
    }
    return YES;
}

- (void)signWithNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardWillShowNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleKeyboardWillHideNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
}

- (void)handleKeyboardWillShowNotification:(NSNotification *)sender {
    NSDictionary *userInfo = sender.userInfo;
    
    CGFloat duration = [sender.userInfo [UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGSize keyboardSize = [userInfo [UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:duration animations:^{
        self.scrollViewBottomLayout.constant = keyboardSize.height;
        [self.view layoutIfNeeded];
    }];
}

- (void)handleKeyboardWillHideNotification:(NSNotification *)sender {
    self.scrollViewBottomLayout.constant = 0.0f;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
