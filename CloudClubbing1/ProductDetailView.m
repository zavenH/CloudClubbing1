//
//  ProductDetailView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 17/10/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "ProductDetailView.h"

@interface ProductDetailView ()

@end

@implementation ProductDetailView
@synthesize productNameLabel, productDescriptionLabel, productPriceLabel, productImageLabel,
    currentProduct, imageFromUrl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Produit";
    
    [self setLabels];
    
    imageFromUrl.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:productImageLabel.text]]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Methods

- (void)getProduct:(id)productObject {
    currentProduct = productObject;
}

- (void)setLabels{
    
    NSString * price = [NSString stringWithFormat:@"%@ euros", currentProduct.productPrice];
    
    productNameLabel.text = currentProduct.productName;
    productDescriptionLabel.text = currentProduct.productDescription;
    productPriceLabel.text = price;
    productImageLabel.text = currentProduct.productPictureURL;
}

@end
