//
//  AsynchLoadImageView.m
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import "AsynchLoadImageView.h"

@implementation AsynchLoadImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)loadImageAsynch:(NSString *)imageUrl
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *)response
{
    self.data = [NSMutableData data];
}

-(void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

-(void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    self.image = [UIImage imageWithData:self.data];
}

@end
