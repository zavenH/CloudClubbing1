//
//  MediaView.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Media.h"

@interface MediaView : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    
    NSMutableArray *Items;
    IBOutlet UICollectionView *itemsTable;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (strong, nonatomic) NSMutableArray *jsonMutableArray;
@property (strong, nonatomic) NSMutableArray *mediaArray;




@end
