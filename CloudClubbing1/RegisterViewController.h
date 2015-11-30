//
//  RegisterViewController.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/06/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UITextField *userId;
@property (weak, nonatomic) IBOutlet UITextField *userMailAdress;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property (weak, nonatomic) IBOutlet UITextField *userPhoneNumber;

@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;


- (IBAction)validationButton:(id)sender;

@end
