//
//  UserView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 20/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "UserView.h"
#import "User.h"

@interface UserView ()

@end

@implementation UserView
@synthesize Name, Login, Address, Phone, Email, Picture;
@synthesize currentUser;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLabels];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getUser:(id)User {
    currentUser = User;
    self.title=@"Mon compte";
}

- (void) setLabels{
    if (currentUser.name != (id)[NSNull null]) {
        Name.text = currentUser.name;
    }
    if (currentUser.login != (id)[NSNull null]) {
        Login.text = currentUser.login;
    }
    if (currentUser.address != (id)[NSNull null]) {
        Address.text = currentUser.address;
    }
    if (currentUser.phone != (id)[NSNull null]) {
        Phone.text = currentUser.phone;
    }
    if (currentUser.email != (id)[NSNull null]) {
        Email.text = currentUser.email;
    }
    if (currentUser.pictureURL != (id)[NSNull null]) {
        [Picture setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:currentUser.pictureURL]]]];
    }
    else
        [Picture setImage:[UIImage imageNamed:@"noPicture.jpg"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
