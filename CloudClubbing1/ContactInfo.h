//
//  ContactInfo.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 22/10/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactInfo : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *description;
@property(nonatomic, strong) NSString *street;
@property(nonatomic, strong) NSString *ZIP;
@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *country;
@property(nonatomic, strong) NSString *telephone;
@property(nonatomic, strong) NSString *website;

- (id) initWithName: (NSString *)cName andDescription: (NSString *)cDescription andStreet: (NSString *)cStreet andZIP: (NSString *)cZIP andCity: (NSString *)cCity andCountry: (NSString *)cCountry andTelephone: (NSString *)cTelephone andWebsite: (NSString *)cWebsite;

@end
