//
//  Feeds.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 17/10/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feeds : NSObject

@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSString *pictureURL;
@property(nonatomic, strong) NSString *likes;
@property(nonatomic, strong) NSString *shares;
@property(nonatomic, strong) NSString *date;

- (id) initWithContent: (NSString *)fContent andPictureURL: (NSString *)fPictureURL andLikes: (NSString *)fLikes andShares: (NSString *)fShares andDate: (NSString *)fDate;

@end
