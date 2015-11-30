//
//  Feeds.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 17/10/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "Feeds.h"

@implementation Feeds

@synthesize content, pictureURL, likes, shares, date;

- (id) initWithContent: (NSString *)fContent andPictureURL: (NSString *)fPictureURL andLikes: (NSString *)fLikes andShares: (NSString *)fShares andDate: (NSString *)fDate{
    self = [super init];
    if (self){
        content = fContent;
        pictureURL = fPictureURL;
        likes = fLikes;
        shares = fShares;
        date = fDate;
    }
    
    return self;
}



@end
