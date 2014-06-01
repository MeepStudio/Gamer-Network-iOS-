//
//  LoginViewController.h
//  Gamer Network
//
//  Created by Danny Huang on 6/1/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (nonatomic) IBOutlet UITextField *usernameTextfield;
@property (nonatomic) IBOutlet UITextField *passwordTextfield;

- (IBAction)finished:(id)sender;

@end
