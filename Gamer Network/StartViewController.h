//
//  VStartViewController.h
//  Gamer Network
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

@property (nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic) IBOutlet UIButton *signupButton;
@property (nonatomic) IBOutlet UIButton *skipButton;

- (IBAction)signUp:(id)sender;
- (IBAction)login:(id)sender;
- (IBAction)skip:(id)sender;


@end
