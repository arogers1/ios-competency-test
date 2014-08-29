//
//  AsynchFriendData.h
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AsynchFriendDataDelegate;

@interface AsynchFriendData : NSObject <NSURLConnectionDelegate>

@property (strong) NSURLConnection *connection;
@property (strong) NSMutableData *data;
@property (weak) id<AsynchFriendDataDelegate> delegate;
@property (strong) NSDictionary *info;
@property BOOL isLoaded;

-(void)loadDataAsynch:(NSString *)url;

@end

@protocol AsynchFriendDataDelegate

-(void)friendDataFinishedLoading;

@end