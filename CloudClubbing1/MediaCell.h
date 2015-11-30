//
//  MediaCell.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Media.h"

@interface MediaCell : UICollectionViewCell{
    IBOutlet UIImageView *picture;
    IBOutlet UILabel *text;
}

-(void)LoadCell:(Media*)Text;

@end
