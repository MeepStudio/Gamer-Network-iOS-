//
//  SearchUserService.h
//  Gamer Network
//
//  Created by Danny Huang on 6/1/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;

@interface SearchUserService : NSObject

+ (void)searchUserByUsername:(NSString *)username andBlock:(void (^)(BOOL success, PFObject *user))block;
+ (void)searchUserByEmail:(NSString *)email andBlock:(void (^)(BOOL success, PFObject *user))block;
+ (void)searchUserBySteamId:(NSString *)steamID andBlock:(void (^)(BOOL success, PFObject *user))block;
+ (void)searchUserByGNId:(NSString *)GNId andBlock:(void (^)(BOOL success, PFObject *user))block;

@end
