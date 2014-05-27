//
//  SignUpViewController.m
//  Gamer Network
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController () <UITextFieldDelegate>

@end

@implementation SignUpViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Sign up";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Finish" style:UIBarButtonItemStylePlain target:self action:@selector(finish)];
}

#pragma mark - Helper Methods

- (IBAction)chooseGame:(id)sender {
    
}

- (void)finish{

}

#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.usernameTextfield) {
        [self.passwordTextfield becomeFirstResponder];
    }
    else if (textField == self.passwordTextfield) {
        [self.confirmPasswordField becomeFirstResponder];
    }
    else if (textField == self.confirmPasswordField) {
        [self.emailTextField becomeFirstResponder];
    }
    else if (textField == self.emailTextField) {
        [self finish];
    }
    
    return NO;
}

@end
