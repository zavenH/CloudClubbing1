//
//  ProductView.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 11/09/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductView : UIViewController <UITableViewDataSource, UITabBarControllerDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (strong, nonatomic) NSMutableArray *jsonMutableArray;
@property (strong, nonatomic) NSMutableArray *productsArray;

- (void) retrieveData;

@end
