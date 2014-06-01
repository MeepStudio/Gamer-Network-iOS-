//
//  SearchUserService.m
//  Gamer Network
//
//  Created by Danny Huang on 6/1/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "SearchUserService.h"
#import <Parse/Parse.h>

@implementation SearchUserService

+ (void)searchUserByEmail:(NSString *)email andBlock:(void (^)(BOOL success, PFObject *user))block {
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"email" equalTo:email];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (objects.count > 0) {
                PFObject *user = [objects firstObject];
                block(YES,user);
            }
            else {
                block(NO,nil);
            }
        }
        else {
            block(NO,nil);
        }
    }];
}

+ (void)searchUserByUsername:(NSString *)username andBlock:(void (^)(BOOL success, PFObject *user))block {
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"username" equalTo:username];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (objects.count > 0) {
                PFObject *user = [objects firstObject];
                block(YES,user);
            }
            else {
                block(NO,nil);
            }
        }
        else {
            block(NO,nil);
        }
    }];
}

+ (void)searchUserBySteamId:(NSString *)steamID andBlock:(void (^)(BOOL success, PFObject *user))block {
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"steamID" equalTo:steamID];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (objects.count > 0) {
                PFObject *user = [objects firstObject];
                block(YES,user);
            }
            else {
                block(NO,nil);
            }
        }
        else {
            block(NO,nil);
        }
    }];
}

+ (void)searchUserByGNId:(NSString *)GNId andBlock:(void (^)(BOOL success, PFObject *user))block {
    PFQuery *query = [PFQuery queryWithClassName:@"Users"];
    [query whereKey:@"GNId" equalTo:GNId];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            if (objects.count > 0) {
                PFObject *user = [objects firstObject];
                block(YES,user);
            }
            else {
                block(NO,nil);
            }
        }
        else {
            block(NO,nil);
        }
    }];
}

@end
