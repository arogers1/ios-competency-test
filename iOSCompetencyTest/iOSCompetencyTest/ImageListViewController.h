//
//  ImageListViewController.h
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCell.h"


@interface ImageListViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray * photos;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

-(void)refresh;

@end
