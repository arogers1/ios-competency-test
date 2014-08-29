//
//  PhotoCell.h
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsynchLoadImageView.h"

@interface PhotoCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet AsynchLoadImageView * imageView;

@end
