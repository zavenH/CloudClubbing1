//
//  User.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 20/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *pictureURL;

@property (nonatomic, strong) NSString *sessionKey;

- (id) initWithSession: (NSString *)uSessionKey andUserID: (NSString*) uID andLogin: (NSString*)uLogin andName: (NSString *)uName andAddress: (NSString *)uAdress andEmail: (NSString *)uEmail andPhone: (NSString *)uPhone andPictureURL: (NSString*)uPictureURL;

//
//user =     {
//    address = "<null>";
//    email = "test@test.com";
//    id = 55;
//    login = test;
//    name = "<null>";
//    phone = "<null>";
//    picURL = "<null>";
//
@end
