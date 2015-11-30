//
//  FeedDetailView.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Feeds.h"

@interface FeedDetailView : UIViewController

@property(nonatomic, strong) IBOutlet UILabel *feedLikes;
@property(nonatomic, strong) IBOutlet UILabel *feedShared;
@property(nonatomic, strong) IBOutlet UILabel *feedDate;
@property(nonatomic, strong) IBOutlet UILabel *feedDescription;
@property(nonatomic, strong) IBOutlet UILabel *feedImageLabel;

@property(nonatomic, strong) IBOutlet UIImageView *imageFromUrl;

@property(nonatomic, strong) Feeds * currentFeed;

- (void)getFeed:(id)feedObject;
- (void)setLabels;


@end
