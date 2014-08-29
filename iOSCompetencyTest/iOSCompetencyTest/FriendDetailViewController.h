//
//  FriendDetailViewController.h
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsynchFriendData.h"
#import "AsynchLoadImageView.h"
#import "ImageListViewController.h"

@interface FriendDetailViewController : UIViewController <AsynchFriendDataDelegate>

@property (strong) AsynchFriendData *friendData;
@property (strong) NSArray *photoUrls;

@property (strong) ImageListViewController *imageListVC;

@property (weak, nonatomic) IBOutlet UIView *profileView;
@property (weak, nonatomic) IBOutlet AsynchLoadImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *availabilitySignifier;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *streetLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

@end
