//
//  MediaView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "MediaView.h"
#import "SWRevealViewController.h"

#import "MediaCell.h"
#import "Media.h"

#define mediaURL @"http://163.5.84.210/api/nightclub/fb_feed.php?id=1&media=1"

@interface MediaView ()

@end

@implementation MediaView
@synthesize jsonMutableArray, mediaArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.title = @"Médias";
    
    
    [self retrieveData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Cells

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return mediaArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    Media *media;
    media = [mediaArray objectAtIndex:indexPath.row];

    
    MediaCell *cell = (MediaCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"MediaCell" forIndexPath:indexPath];
    [cell LoadCell:media];

    return cell;
}

- (void) retrieveData{
    NSURL *url = [NSURL URLWithString:mediaURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *dataToString = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
    
    // START Data debug
    // NSLog(@"%@",dataToString);
    // END Data debug
    
    
    NSData *jsonStringToData = [dataToString dataUsingEncoding:NSUTF8StringEncoding];
    
    jsonMutableArray = [NSJSONSerialization JSONObjectWithData:jsonStringToData options:NSJSONReadingMutableContainers error:nil];
    
    // DEBUG Dictionary
     // NSLog(@"%@", jsonMutableArray);
    // NSLog(@"--count%lu--",(unsigned long)jsonMutableArray.count);
    // End DEBUG
    
    mediaArray = [[NSMutableArray alloc] init];
    
    
    for (int i = 0; i < ([[jsonMutableArray valueForKeyPath:@"feed"] count]); i++) {
        
        NSString *mContent = [[jsonMutableArray  valueForKeyPath:@"feed"][i] objectForKey:@"content"];
        NSString *mPicture = [[jsonMutableArray  valueForKeyPath:@"feed"][i] objectForKey:@"pictureURL"];
        
        // DEBUG content of Strings
        // NSLog(@"%@ -- %@ -- %@ -- %@ -- %@ -- %@", pID, pName, pDescription, pPictureID, pPrice, pPictureURL);
        // End of DEBUG
      
        [mediaArray addObject:[[Media alloc] initWithContent:mContent andPicutureURL:mPicture]];
    }
    [self->itemsTable reloadData];

}



@end
