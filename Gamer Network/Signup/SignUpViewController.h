//
//  SignUpViewController.h
//  Gamer Network
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (nonatomic) IBOutlet UIButton *chooseGameButton;
@property (nonatomic) IBOutlet UITextField *usernameTextfield;
@property (nonatomic) IBOutlet UITextField *passwordTextfield;
@property (nonatomic) IBOutlet UITextField *confirmPasswordTextfield;
@property (nonatomic) IBOutlet UITextField *emailTextfield;
@property (nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (IBAction)chooseGame:(id)sender;

@end
