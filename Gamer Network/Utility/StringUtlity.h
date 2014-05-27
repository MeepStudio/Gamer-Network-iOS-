//
//  StringUtlity.h
//  Gamer Network
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtlity : NSObject

+ (BOOL)checkIfUsernameIsValid:(NSString *)username;
+ (BOOL)checkIfPasswordIsValid:(NSString *)password;
+ (BOOL)checkIfEmailIsValid:(NSString *)email;

@end
