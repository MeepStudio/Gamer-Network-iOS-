//
//  FriendsMessengerViewController.h
//  Gamer Network
//
//  Created by Danny Huang on 6/1/14.
//  Copyright (c) 2014 Meep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsMessengerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) IBOutlet UITableView *friendsTableview;

- (id)initWithFriends:(NSArray *)friendsList;

@end
