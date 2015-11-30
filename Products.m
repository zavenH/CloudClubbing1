//
//  Products.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 11/09/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "Products.h"

@implementation Products
@synthesize productID, productName, productDescription, productPictureID, productPrice, productPictureURL;

- (id) initWithProductID: (NSString *)pID andProductName: (NSString *)pName andProductDesctiption: (NSString *)pDescription andProductPictureID: (NSString *)pPictureID andProductPrice: (NSString *)pPrice andProductPictureURL: (NSString *)pPictureURL{
    self = [super init];
    if (self){
        productID = pID;
        productName = pName;
        productDescription = pDescription;
        productPictureID = pPictureID;
        productPrice = pPrice;
        productPictureURL = pPictureURL;
    }
    
    return self;
}

@end
