//
//  SignUpViewController.m
//  Gamer Network
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>
#import "UserService.h"
#import "User.h"
#import "HomescreenViewController.h"

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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
}

#pragma mark - Helper Methods

- (IBAction)chooseGame:(id)sender {
    
}

- (void)finish{
    if (![UserService checkIfUsernameIsValid:self.usernameTextfield.text]) {
        return;
    }
    if (![UserService checkIfPasswordIsValid:self.passwordTextfield.text]) {
        return;
    }
    if (![self.passwordTextfield.text isEqualToString:self.confirmPasswordTextfield.text]) {
        return;
    }
    if (![UserService checkIfEmailIsValid:self.emailTextfield.text]) {
        return;
    }
    
    self.view.userInteractionEnabled = NO;
    self.spinner.hidden = NO;
    [self.spinner startAnimating];
    
    __block PFObject *userObject = [PFObject objectWithClassName:@"Users"];
    __block User *user = [[User alloc] init];
    userObject[@"password"] = self.passwordTextfield.text;
    user.password = self.passwordTextfield.text;
        
    [UserService checkIfUserIsTaken:self.usernameTextfield.text andblock:^(BOOL success, BOOL isTaken) {
        if (success) {
            if (isTaken) {
                NSLog(@"%@ is taken",self.usernameTextfield.text);
                [UserService displayAlertView:ErrorTypeUsernameTaken];
                [self.spinner stopAnimating];
                self.view.userInteractionEnabled = YES;
            }
            else {
                NSLog(@"%@ is not taken",self.usernameTextfield.text);
                userObject[@"username"] = self.usernameTextfield.text;
                user.username = self.usernameTextfield.text;

                [UserService checkIfEmailIsTaken:self.emailTextfield.text andBlock:^(BOOL success, BOOL isTaken) {
                    if (success) {
                        if (isTaken) {
                            NSLog(@"%@ is taken",self.emailTextfield.text);
                            [UserService displayAlertView:ErrorTypeEmailTaken];
                            [self.spinner stopAnimating];
                            self.view.userInteractionEnabled = YES;
                        }
                        else {
                            NSLog(@"%@ is not taken",self.emailTextfield.text);
                            userObject[@"email"] = self.emailTextfield.text;
                            user.email = self.emailTextfield.text;
                            [userObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                if (!error) {
                                    NSLog(@"User created successfully");
                                    [self signUpFinished:user];
                                }
                                [self.spinner stopAnimating];
                                self.view.userInteractionEnabled = YES;
                            }];
                        }
                    }
                    else {
                        [UserService displayAlertView:ErrorTypeUnknown];
                        [self.spinner stopAnimating];
                        self.view.userInteractionEnabled = YES;
                    }
                }];
            }
        }
        else {
            [UserService displayAlertView:ErrorTypeUnknown];
            [self.spinner stopAnimating];
            self.view.userInteractionEnabled = YES;
        }
    }];
    
}

- (void)signUpFinished:(User *)user {
    HomescreenViewController *vc = [[HomescreenViewController alloc] initWithUser:user];
    NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithObjects:vc, nil];
    self.navigationController.viewControllers = viewControllers;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - UITextField Delegates && Helpers

- (void)keyboardDidShow {
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if ([self.confirmPasswordTextfield isFirstResponder]) {
        [self.view setFrame:CGRectMake(0, -30, screenBounds.size.width, screenBounds.size.height)];
    }
    else if ([self.emailTextfield isFirstResponder]) {
        [self.view setFrame:CGRectMake(0, -100, screenBounds.size.width, screenBounds.size.height)];
    }
}

- (void)keyboardDidHide {
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    [self.view setFrame:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self keyboardDidShow];
}

- (void)dismissKeyboard {
    [self.usernameTextfield resignFirstResponder];
    [self.passwordTextfield resignFirstResponder];
    [self.confirmPasswordTextfield resignFirstResponder];
    [self.emailTextfield resignFirstResponder];
    [self keyboardDidHide];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.usernameTextfield) {
        [self.passwordTextfield becomeFirstResponder];
    }
    else if (textField == self.passwordTextfield) {
        [self.confirmPasswordTextfield becomeFirstResponder];
        [self keyboardDidShow];
    }
    else if (textField == self.confirmPasswordTextfield) {
        [self.emailTextfield becomeFirstResponder];
        [self keyboardDidShow];
    }
    else if (textField == self.emailTextfield) {
        [self.emailTextfield resignFirstResponder];
        [self keyboardDidHide];
        [self finish];
    }
    
    return NO;
}

@end
