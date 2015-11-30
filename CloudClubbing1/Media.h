//
//  Media.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Media : NSObject{
    NSString *ImagePath;
    NSString *Description;
}

@property (nonatomic) NSString *ImagePath;
@property (nonatomic) NSString *Description;


- (id) initWithContent: (NSString *)mContent andPicutureURL: (NSString *)mPicture;
@end
