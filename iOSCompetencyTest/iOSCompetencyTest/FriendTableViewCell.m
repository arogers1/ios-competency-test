//
//  FriendTableViewCell.m
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setUpCellWithImageUrl:(NSString *)imageUrl andName:(NSString *)fullName andStatus:(NSString *)status andIsAvailable:(BOOL)isAvailable
{
    [_profileImageView loadImageAsynch:imageUrl];
    [_fullNameLabel setText:fullName];
    [_statusLabel setText:status];
    if(isAvailable)
    {
        [_availabilityButton setImage:[UIImage imageNamed:@"FilledCircle.png"] forState:UIControlStateNormal];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
