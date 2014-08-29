//
//  FriendTableViewController.m
//  iOSCompetencyTest
//
//  Created by Adam Rogers on 8/29/14.
//  Copyright (c) 2014 Adam Rogers. All rights reserved.
//

#import "FriendTableViewController.h"

@interface FriendTableViewController ()

@end

@implementation FriendTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _friendsArray = [NSArray array];
    _friendDataArray = [NSMutableArray array];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://angularjstest.apiary-mock.com/friends"]];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*) jsonizeResponse
{
    NSError *error = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
    if(error!=nil)
    {
        NSLog(@"%@",error);
        return nil;
    }
    else
    {
        return jsonArray;
    }
}

// The following are delegate methods for NSURLConnection.

// -------------------------------------------------------------------------------
//	connection:didReceiveResponse:response
// -------------------------------------------------------------------------------
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.responseData = [NSMutableData data];    // start off with new data
}

// -------------------------------------------------------------------------------
//	connection:didReceiveData:data
// -------------------------------------------------------------------------------
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];  // append incoming data
}

// -------------------------------------------------------------------------------
//	connection:didFailWithError:error
// -------------------------------------------------------------------------------
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed with error %@",[error description]);
    self.connection = nil;   // release our connection
}

// -------------------------------------------------------------------------------
//	connectionDidFinishLoading:connection
// -------------------------------------------------------------------------------
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.connection = nil;   // release our connection
    
    
    NSString *returned = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSLog(@"returned:%@",returned);
    
    _friendsArray = [self jsonizeResponse];
    for(NSDictionary *dict in _friendsArray)
    {
        AsynchFriendData *friendData = [[AsynchFriendData alloc] init];
        [friendData loadDataAsynch:@"http://angularjstest.apiary-mock.com/friends/id"];
        friendData.delegate = self;
        [_friendDataArray addObject:friendData];
    }
    
    [self.tableView reloadData];
}

#pragma mark - AsynchFriendData delegate

-(void)friendDataFinishedLoading
{
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_friendsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendTableViewCell *cell = (FriendTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    
    NSDictionary *info = [_friendsArray objectAtIndex:indexPath.row];
    NSString *imageUrl = [info objectForKey:@"img"];
    NSString *fullName = [NSString stringWithFormat:@"%@ %@",[info objectForKey:@"first_name"], [info objectForKey:@"last_name"]];
    NSString *status = [info objectForKey:@"status"];
    BOOL isAvailable = [[info valueForKey:@"available"] boolValue];
    
    [cell setUpCellWithImageUrl:imageUrl andName:fullName andStatus:status andIsAvailable:isAvailable];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"DetailViewSegue" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FriendDetailViewController *fdvc = (FriendDetailViewController *)[segue destinationViewController];
    AsynchFriendData *selectedFriend = [_friendDataArray objectAtIndex:_selectedRow];
    selectedFriend.delegate = fdvc;
    fdvc.friendData = selectedFriend;
}


@end
