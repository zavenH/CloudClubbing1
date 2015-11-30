//
//  User.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 20/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize userID, login, name, address, email, phone, pictureURL, sessionKey;

- (id) initWithSession: (NSString *)uSessionKey andUserID:uID andLogin: (NSString*)uLogin andName: (NSString *)uName andAddress: (NSString *)uAddress andEmail: (NSString *)uEmail andPhone: (NSString *)uPhone andPictureURL: (NSString*)uPictureURL {
    self = [super init];
    if (self){
        sessionKey = uSessionKey;
        userID = uID;
        login = uLogin;
        name = uName;
        address = uAddress;
        email = uEmail;
        phone = uPhone;
        pictureURL = uPictureURL;
    }
    
    return self;
}

@end
