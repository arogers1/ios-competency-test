//
//  AsynchLoadImageView.h
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AsynchLoadImageView : UIImageView <NSURLConnectionDelegate>

@property (strong) NSURLConnection *connection;
@property (strong) NSMutableData *data;

-(void)loadImageAsynch:(NSString *)imageUrl;

@end
