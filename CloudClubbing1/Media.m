//
//  Media.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "Media.h"

@implementation Media
@synthesize ImagePath, Description;

- (id) initWithContent: (NSString *)mContent andPicutureURL: (NSString *)mPicture{
    self = [super init];
    if (self){
        Description = mContent;
        ImagePath = mPicture;
    }
    return self;
}

@end
