//
//  ProductDetailView.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 17/10/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Products.h"


@interface ProductDetailView : UIViewController

@property(nonatomic, strong) IBOutlet UILabel *productNameLabel;
@property(nonatomic, strong) IBOutlet UILabel *productDescriptionLabel;
@property(nonatomic, strong) IBOutlet UILabel *productPriceLabel;
@property(nonatomic, strong) IBOutlet UILabel *productImageLabel;

@property(nonatomic, strong) IBOutlet UIImageView *imageFromUrl;

@property(nonatomic, strong) Products * currentProduct;

- (void)getProduct:(id)productObject;
- (void)setLabels;

@end
