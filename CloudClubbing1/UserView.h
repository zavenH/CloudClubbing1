//
//  UserView.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 20/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserView : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UILabel *Login;
@property (weak, nonatomic) IBOutlet UILabel *Address;
@property (weak, nonatomic) IBOutlet UILabel *Phone;
@property (weak, nonatomic) IBOutlet UILabel *Email;
@property (weak, nonatomic) IBOutlet UIImageView *Picture;

@property(nonatomic, strong) User * currentUser;


- (void) getUser:(id)User;
- (void) setLabels;
@end
