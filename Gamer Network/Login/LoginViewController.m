//
//  LoginViewController.m
//  Gamer Network
//
//  Created by Danny Huang on 6/1/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "LoginViewController.h"
#import "UserService.h"
#import "User.h"
#import <Parse/Parse.h>
#import "HomescreenViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@end

@implementation LoginViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Login";
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

#pragma mark - Helper Methods

- (void)dismissKeyboard {
    [self.usernameTextfield resignFirstResponder];
    [self.passwordTextfield resignFirstResponder];
}

- (IBAction)finished:(id)sender {
    if (![UserService checkIfUsernameIsValid:self.usernameTextfield.text]) {
        return;
    }
    if (![UserService checkIfPasswordIsValid:self.passwordTextfield.text]) {
        return;
    }
    
    self.view.userInteractionEnabled = NO;
    self.spinner.hidden = NO;
    [self.spinner startAnimating];
    
    [UserService loginWithCredentials:self.usernameTextfield.text andPassword:self.passwordTextfield.text andBlock:^(BOOL success, PFObject *objects) {
        self.view.userInteractionEnabled = YES;
        self.spinner.hidden = YES;
        if (success) {
            User *user = [[User alloc] init];
            user.userId = objects.objectId;
            user.username = objects[@"username"];
            user.email = objects[@"email"];
            user.preferredGame = objects[@"preferredGame"];
            [self loginFinished:user];
        }
        else {
            [UserService displayAlertView:ErrorTypeLoginFailed];
        }
    }];
    
}

- (void)loginFinished:(User *)user {
    HomescreenViewController *vc = [[HomescreenViewController alloc] initWithUser:user];
    NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithObjects:vc, nil];
    self.navigationController.viewControllers = viewControllers;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - UITextfiel Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.usernameTextfield) {
        [self.passwordTextfield becomeFirstResponder];
    }
    else if (textField == self.passwordTextfield) {
        [self dismissKeyboard];
        [self finished:nil];
    }
    return NO;
}

@end
