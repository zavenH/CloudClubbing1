//
//  Products.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 11/09/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject


@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productDescription;
@property (strong, nonatomic) NSString *productPictureID;
@property (strong, nonatomic) NSString *productPrice;
@property (strong, nonatomic) NSString *productPictureURL;


- (id) initWithProductID: (NSString *)pID andProductName: (NSString *)pName andProductDesctiption: (NSString *)pDescription andProductPictureID: (NSString *)pPictureID andProductPrice: (NSString *)pPrice andProductPictureURL: (NSString *)pPictureURL;

@end
