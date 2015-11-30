//
//  RestAPI.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 20/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RestAPI;
@protocol RestAPIDelegate
- (void)getReceivedData:(NSMutableData *)data sender:(RestAPI*)sender;
@end

@interface RestAPI : NSObject
- (void)httpRequest:(NSMutableURLRequest*)request;

@property (nonatomic, weak) id <RestAPIDelegate> delegate;
@end

#define POST @"POST"
#define GET @"GET"
