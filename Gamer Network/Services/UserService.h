//
//  UserService.h
//  Gamer Network
//
//  Created by Danny on 5/27/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AlertViewErrorType) {
    ErrorTypePasswordNotLongEnough,
    ErrorTypePasswordTooLong,
    ErrorTypePasswordInvalidFormat,
    ErrorTypeEmailInvalidFormat,
    ErrorTypeEmailTaken,
    ErrorTypeUsernameNotLongEnough,
    ErrorTypeUsernameTooLong,
    ErrorTypeUsernameInvalidFormat,
    ErrorTypeUsernameTaken,
    ErrorTypeLoginFailed,
    ErrorTypeUnknown,
};

@class PFObject;

@interface UserService : NSObject

+ (void)checkIfUserIsTaken:(NSString *)username andblock:(void(^)(BOOL success, BOOL isTaken))block;
+ (void)checkIfEmailIsTaken:(NSString *)email andBlock:(void(^)(BOOL success, BOOL isTaken))block;

+ (BOOL)checkIfUsernameIsValid:(NSString *)username;
+ (BOOL)checkIfPasswordIsValid:(NSString *)password;
+ (BOOL)checkIfEmailIsValid:(NSString *)email;

+ (void)displayAlertView:(AlertViewErrorType)errorType;

+ (void)loginWithCredentials:(NSString *)username andPassword:(NSString *)password andBlock:(void(^) (BOOL success, PFObject *objects))block;

@end
