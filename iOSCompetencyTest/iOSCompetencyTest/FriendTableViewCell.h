//
//  FriendTableViewCell.h
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsynchLoadImageView.h"

@interface FriendTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet AsynchLoadImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *availabilityButton;

- (void)setUpCellWithImageUrl:(NSString *)imageUrl andName:(NSString *)fullName andStatus:(NSString *)status andIsAvailable:(BOOL)isAvailable;

@end
