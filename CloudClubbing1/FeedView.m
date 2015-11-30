//
//  FeedView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 17/10/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "FeedView.h"
#import "Feeds.h"
#import "FeedDetailView.h"

#import "SWRevealViewController.h"

#define jsonFeedURL @"http://163.5.84.210/api/nightclub/fb_feed.php?id=1&max=0"

@interface FeedView ()

@end

@implementation FeedView
@synthesize jsonMutableArray, feedsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
        
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.title = @"Actualité";
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(retrieveData:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self retrieveData: refreshControl];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return feedsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"FeedCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Feeds * feeds;
    feeds = [feedsArray objectAtIndex:indexPath.row];
        
    cell.textLabel.text = feeds.content;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        
        NSIndexPath * indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
        
        //NSLog(@"ROW -- %@", indexPath);
        Feeds *feed;
        feed = [feedsArray objectAtIndex:indexPath.row];
        //NSLog(@"SEGUE -- %@", product.productName);
        [[segue destinationViewController] getFeed:feed];
    }
}

#pragma mark - Methods

- (void) retrieveData:(UIRefreshControl*)refreshControl{
    NSURL *url = [NSURL URLWithString:jsonFeedURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *dataToString = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
    NSData *jsonStringToData = [dataToString dataUsingEncoding:NSUTF8StringEncoding];
    
    jsonMutableArray = [NSJSONSerialization JSONObjectWithData:jsonStringToData options:NSJSONReadingMutableContainers error:nil];
    
    // DEBUG Dictionary
    // NSLog(@"%@", jsonMutableArray);
    // NSLog(@"--count%lu--",(unsigned long)([[jsonMutableArray valueForKeyPath:@"feed"] count]));
    // End DEBUG
    
    feedsArray = [[NSMutableArray alloc] init];
    
    
    for (long i = 0; i < [[jsonMutableArray valueForKeyPath:@"feed"] count]; i++){
        NSString *fContent = [[jsonMutableArray  valueForKeyPath:@"feed"][i] objectForKey:@"content"];
        NSString *fPictureURL = [[jsonMutableArray  valueForKeyPath:@"feed"][i] objectForKey:@"pictureURL"];
        NSString *fLikes = [[jsonMutableArray  valueForKeyPath:@"feed"][i] objectForKey:@"likes"];
        NSString *fShares = [[jsonMutableArray valueForKeyPath:@"feed"][i] objectForKey:@"shares"];
        NSString *fDate = [[jsonMutableArray valueForKeyPath:@"feed"][i] objectForKey:@"date"];
        
        // DEBUG content of Strings
        // NSLog(@"%@ -- %@ -- %@ -- %@ -- %@ -- %@", pID, pName, pDescription, pPictureID, pPrice, pPictureURL);
        // End of DEBUG
        
        [feedsArray addObject:[[Feeds alloc] initWithContent: fContent andPictureURL: fPictureURL andLikes: fLikes andShares: fShares andDate: fDate]];
        
    }

    [self.tableView reloadData];
    [refreshControl endRefreshing];
    
}

@end
