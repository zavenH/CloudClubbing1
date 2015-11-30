//
//  MediaCell.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "MediaCell.h"

@implementation MediaCell

-(void)LoadCell:(Media*)MediaItem{
    [text setText:MediaItem.Description];
    
    if ([MediaItem.ImagePath isEqual:@""]) {
        [picture setImage:[UIImage imageNamed:@"FB3.jpg"]];
    }
    else
        [picture setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:MediaItem.ImagePath]]]];

}

@end
