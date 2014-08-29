//
//  FriendDetailViewController.m
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import "FriendDetailViewController.h"

@interface FriendDetailViewController ()

@end

@implementation FriendDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(_friendData.isLoaded)
    {
        // Asynchronous loading of friend data was already finished when we got here
        NSLog(@"Friend Data already loaded: %@",_friendData.info);
        [self populateView];
    }
}

-(void)populateView
{
    NSDictionary *info = _friendData.info;
    NSString *imageUrl = [info objectForKey:@"img"];
    [_profileImageView loadImageAsynch:imageUrl];
    [_nameLabel setText:[NSString stringWithFormat:@"%@ %@",[info objectForKey:@"first_name"],[info objectForKey:@"last_name"]]];
    [_bioLabel setText:[info objectForKey:@"bio"]];
    [_statusLabel setText:[(NSArray *)[info objectForKey:@"statuses"] objectAtIndex:0]];
    BOOL isAvailable = [[info valueForKey:@"available"] boolValue];
    if(isAvailable)
    {
        [_availabilitySignifier setImage:[UIImage imageNamed:@"FilledCircle.png"] forState:UIControlStateNormal];
    }
    [_phoneLabel setText:[info objectForKey:@"phone"]];
    [_streetLabel setText:[info objectForKey:@"address_1"]];
    [_cityLabel setText:[NSString stringWithFormat:@"%@, %@ %@",[info objectForKey:@"city"],[info objectForKey:@"state"],[info objectForKey:@"zipcode"]]];
    
    // Here we are trying to load the returned photos in a collection view.
    // Unfortunately this won't work because the returned url needs to be handled
    // through the Flickr API, and I didn't have time to implement that.
    _photoUrls = (NSArray *)[info objectForKey:@"photos"];
    _imageListVC.photos = _photoUrls;
    [_imageListVC refresh];
    
    [_loadingLabel setHidden:YES];
    [_profileView setHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"imageList"]){
        ImageListViewController * vc = segue.destinationViewController;
        _imageListVC = vc;
    }
}

#pragma mark - AsynchFriendData delegate

-(void)friendDataFinishedLoading
{
    // Asynchronous loading of friend data finished
    NSLog(@"Finished Loading Friend Data: %@",_friendData.info);
    [self populateView];
}

@end
