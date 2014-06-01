//
//  HomescreenViewController.m
//  Gamer Network
//
//  Created by Danny Huang on 6/1/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "HomescreenViewController.h"

@interface HomescreenViewController ()

@property (nonatomic) User *user;

@end

@implementation HomescreenViewController

#pragma mark - View Lifecycle

- (id)initWithUser:(User *)user {
    if (self = [super init]) {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Home";
}

@end
