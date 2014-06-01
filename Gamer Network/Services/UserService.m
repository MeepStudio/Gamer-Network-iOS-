//
//  UserService.h
//  Gamer Network
//
//  Created by Danny on 5/27/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "UserService.h"
#import <Parse/Parse.h>

#define USERNAME_MINIMUM_LENGTH 4
#define USERNAME_MAXIMUM_LENGTH 20

#define PASSWORD_MINIMUM_LENGTH 4
#define PASSWORD_MAXIMUM_LENGTH 15

@implementation UserService

+ (void)checkIfUserIsTaken:(NSString *)username andblock:(void(^)(BOOL success, BOOL isTaken))block {
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"username" equalTo:username];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error) {
            if (objects.count > 0) {
                block(YES,YES);
            }
            else {
                block(YES,NO);
            }
        }
        else {
            block(NO,NO);
        }
    }];
}

+ (void)checkIfEmailIsTaken:(NSString *)email andBlock:(void(^)(BOOL sucess, BOOL isTaken))block {
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"email" equalTo:email];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error) {
            if (objects.count > 0) {
                block(YES,YES);
            }
            else {
                block(YES,NO);
            }
        }
        else {
            block(NO,NO);
        }
    }];
}

+ (BOOL)checkIfEmailIsValid:(NSString *)email {
    
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if (![emailTest evaluateWithObject:email]) {
        [self displayAlertView:ErrorTypeEmailInvalidFormat];
        return NO;
    }
    
    return YES;
}

+ (BOOL)checkIfPasswordIsValid:(NSString *)password {
    
    if (password.length < PASSWORD_MINIMUM_LENGTH) {
        [self displayAlertView:ErrorTypePasswordNotLongEnough];
        return NO;
    }
    
    if (password.length > PASSWORD_MAXIMUM_LENGTH) {
        [self displayAlertView:ErrorTypePasswordTooLong];
        return NO;
    }
    
    NSCharacterSet *s = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
    
    s = [s invertedSet];
    
    NSRange r = [password rangeOfCharacterFromSet:s];
    if (r.location != NSNotFound) {
        [self displayAlertView:ErrorTypePasswordInvalidFormat];
        return NO;
    }
    
    return YES;
}

+ (BOOL)checkIfUsernameIsValid:(NSString *)username {
    
    if (username.length < USERNAME_MINIMUM_LENGTH) {
        [self displayAlertView:ErrorTypeUsernameNotLongEnough];
        return NO;
    }
    
    if (username.length > USERNAME_MAXIMUM_LENGTH) {
        [self displayAlertView:ErrorTypeUsernameTooLong];
        return NO;
    }
    
    NSCharacterSet *s = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_"];
    
    s = [s invertedSet];
    
    NSRange r = [username rangeOfCharacterFromSet:s];
    if (r.location != NSNotFound) {
        [self displayAlertView:ErrorTypeUsernameInvalidFormat];
        return NO;
    }
    
    return YES;
}

+ (void)displayAlertView:(AlertViewErrorType)errorType {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    switch (errorType) {
        case ErrorTypeEmailInvalidFormat:
            alert.title = @"Email Invalid";
            alert.message = @"This email seems to contain special characters or incomplete, please fix it";
            break;
            
        case ErrorTypeEmailTaken:
            alert.title = @"Email taken";
            alert.message = @"This email is taken, please use a new one";
            break;
            
        case ErrorTypePasswordInvalidFormat:
            alert.title = @"Password Invalid";
            alert.message = @"Your password seems to contain special characters, please remove it";
            break;
            
        case ErrorTypePasswordNotLongEnough:
            alert.title = @"Password too short";
            alert.message = [NSString stringWithFormat:@"Your password length is too short, the minimum is %d characters",PASSWORD_MINIMUM_LENGTH];
            break;
            
        case ErrorTypePasswordTooLong:
            alert.title = @"Password too long";
            alert.message = [NSString stringWithFormat:@"Your password length is too long, the limit is %d characters",PASSWORD_MAXIMUM_LENGTH];
            break;
            
        case ErrorTypeUsernameInvalidFormat:
            alert.title = @"Invalid Username";
            alert.message = @"Your username seems to contain special characters, please remove it";
            break;
            
        case ErrorTypeUsernameNotLongEnough:
            alert.title = @"Username too short";
            alert.message =[NSString stringWithFormat:@"Your username length is too short, the limit is %d characters", USERNAME_MINIMUM_LENGTH];
            break;
            
        case ErrorTypeUsernameTooLong:
            alert.title = @"Username too long";
            alert.message =[NSString stringWithFormat:@"Your username length is too long, the limit is %d characters", USERNAME_MAXIMUM_LENGTH];
            break;
            
        case ErrorTypeUsernameTaken:
            alert.title = @"Username is taken";
            alert.message = @"This username is taken, please use a new one";
            break;
            
        case ErrorTypeUnknown:
            alert.title = @"Unknown error has occured";
            alert.message = @"An unknown error has occured, please try again later";
            break;
            
        default:
            break;
    }
    [alert show];
}

@end
