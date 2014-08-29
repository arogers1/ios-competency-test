//
//  AsynchFriendData.m
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import "AsynchFriendData.h"

@implementation AsynchFriendData

-(id)init
{
    self = [super init];
    if(self)
    {
        self.isLoaded = NO;
    }
    return self;
}

-(NSDictionary*) jsonizeResponse
{
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:self.data options:kNilOptions error:&error];
    if(error!=nil)
    {
        NSLog(@"%@",error);
        return nil;
    }
    else
    {
        return jsonDict;
    }
}

-(void)loadDataAsynch:(NSString *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
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
    self.info = [self jsonizeResponse];
    _isLoaded = YES;
}

@end
