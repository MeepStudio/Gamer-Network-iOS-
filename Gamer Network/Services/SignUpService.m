//
//  SignUpService.m
//  Gamer Network
//
//  Created by Danny on 5/27/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "SignUpService.h"
#import "StringUtlity.h"
#import <Parse/Parse.h>

@implementation SignUpService
+ (BOOL)checkIfEmailIsTaken:(NSString *)email withIndicator:(UIView *)spinnerHUD {
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
        }
        else {
            
        }
    }];
    return NO;
}

+ (BOOL)checkIfUserNameIsTaken:(NSString *)username {
    
}

@end
