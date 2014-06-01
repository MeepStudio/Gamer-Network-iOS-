//
//  StartViewController.m
//  Gamer Network
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "StartViewController.h"
#import "SignUpViewController.h"
#import "LoginViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    LoginViewController *vc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)signUp:(id)sender {
    SignUpViewController *vc = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)skip:(id)sender {
    
}

@end
