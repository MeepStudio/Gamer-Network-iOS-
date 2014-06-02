//
//  FriendsMessengerViewController.m
//  Gamer Network
//
//  Created by Danny Huang on 6/1/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import "FriendsMessengerViewController.h"

@interface FriendsMessengerViewController ()

@property (nonatomic) NSArray *friendsKeyArray;
@property (nonatomic) NSDictionary *friendsListDict;

@end

@implementation FriendsMessengerViewController

#pragma mark - View Lifecycle

- (id)initWithFriends:(NSArray *)friendsList {
    if (self = [super init]) {
        self.friendsKeyArray = friendsList;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


#pragma mark - UITableview datasource and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.friendsKeyArray.count; 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}


@end
