//
//  ContactInfo.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 22/10/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "ContactInfo.h"

@implementation ContactInfo

@synthesize name, description, street, ZIP, city, country, telephone, website;

- (id) initWithName: (NSString *)cName andDescription: (NSString *)cDescription andStreet: (NSString *)cStreet andZIP: (NSString *)cZIP andCity: (NSString *)cCity andCountry: (NSString *)cCountry andTelephone: (NSString *)cTelephone andWebsite: (NSString *)cWebsite{
    self = [super init];
    if (self){
        name = cName;
        description = cDescription;
        street = cStreet;
        ZIP = cZIP;
        city = cCity;
        country = cCountry;
        telephone = cTelephone;
        website = cWebsite;
    }
    
    return self;

}


@end
