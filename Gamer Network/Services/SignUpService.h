//
//  SignUpService.h
//  Gamer Network
//
//  Created by Danny on 5/27/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpService : NSObject

+ (BOOL)checkIfUserNameIsTaken:(NSString *)username;
+ (BOOL)checkIfEmailIsTaken:(NSString *)email;

@end
