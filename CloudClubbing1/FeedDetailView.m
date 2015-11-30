//
//  FeedDetailView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "FeedDetailView.h"

@interface FeedDetailView()

@end

@implementation FeedDetailView
@synthesize feedLikes, feedDate, feedDescription, feedShared, feedImageLabel, imageFromUrl, currentFeed;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setLabels];
    
    imageFromUrl.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:feedImageLabel.text]]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods

- (void)getFeed:(id)feedObject {
    currentFeed = feedObject;
    self.title=currentFeed.content;

}

- (void)setLabels{
    feedDate.text = currentFeed.date;
    feedDescription.text = currentFeed.description;
    feedLikes.text = currentFeed.likes;
    feedShared.text = currentFeed.shares;
    feedImageLabel.text = currentFeed.pictureURL;

}

@end
