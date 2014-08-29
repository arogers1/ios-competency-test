//
//  FriendTableViewController.h
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendTableViewCell.h"
#import "AsynchFriendData.h"
#import "FriendDetailViewController.h"

@interface FriendTableViewController : UITableViewController <NSURLConnectionDelegate, AsynchFriendDataDelegate>

@property (strong, nonatomic) NSMutableData* responseData;
@property (strong, nonatomic) NSURLConnection* connection;
@property (strong, nonatomic) NSArray* friendsArray;
@property (strong, nonatomic) NSMutableArray* friendDataArray;
@property NSInteger selectedRow;

@end
