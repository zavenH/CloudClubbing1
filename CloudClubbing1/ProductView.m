//
//  ProductView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 11/09/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "ProductView.h"
#import "Products.h"
#import "ProductDetailView.h"

#import "SWRevealViewController.h"

//#define jsonProductURL @"http://163.5.84.210/api/product/product_nightclub.php?id=1"

@interface ProductView ()

@end

@implementation ProductView
@synthesize jsonMutableArray, productsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.title = @"Liste des Produits";
    
   [self retrieveData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return productsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Products * products;
    products = [productsArray objectAtIndex:indexPath.row];

    cell.textLabel.text = products.productName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        
        NSIndexPath * indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
        
        //NSLog(@"ROW -- %@", indexPath);
        Products *product;
        product = [productsArray objectAtIndex:indexPath.row];
        //NSLog(@"SEGUE -- %@", product.productName);
        [[segue destinationViewController] getProduct:product];
    }
}

#pragma mark - Methods

- (void) retrieveData{
    NSURL *url = [NSURL URLWithString:@"http://163.5.84.210/api/product/product_nightclub.php?id=1"];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *dataToString = [[NSString alloc] initWithData:data encoding: NSUTF8StringEncoding];
 
    // START Data debug
    // NSLog(@"%@",dataToString);
    // END Data debug
    
    
    NSData *jsonStringToData = [dataToString dataUsingEncoding:NSUTF8StringEncoding];
    
    jsonMutableArray = [NSJSONSerialization JSONObjectWithData:jsonStringToData options:NSJSONReadingMutableContainers error:nil];

    // DEBUG Dictionary
    // NSLog(@"%@", jsonMutableArray);
    // NSLog(@"--count%lu--",(unsigned long)jsonMutableArray.count);
    // End DEBUG
    
    productsArray = [[NSMutableArray alloc] init];

    
     for (int i = 0; i < ([[jsonMutableArray valueForKeyPath:@"prod"] count]); i++) {
   
        NSString *pID = [[jsonMutableArray  valueForKeyPath:@"prod"][i] objectForKey:@"ArticleID"];
        NSString *pName = [[jsonMutableArray  valueForKeyPath:@"prod"][i] objectForKey:@"Nom"];
        NSString *pDescription = [[jsonMutableArray  valueForKeyPath:@"prod"][i] objectForKey:@"Desc"];
        NSString *pPictureID = [[jsonMutableArray valueForKeyPath:@"prod"][i] objectForKey:@"Picture_PictureID"];
        NSString *pPrice = [[jsonMutableArray valueForKeyPath:@"prod"][i] objectForKey:@"Price"];
        NSString *pPictureURL = [[jsonMutableArray valueForKeyPath:@"prod"][i] objectForKey:@"PictureURL"];

        // DEBUG content of Strings
       // NSLog(@"%@ -- %@ -- %@ -- %@ -- %@ -- %@", pID, pName, pDescription, pPictureID, pPrice, pPictureURL);
        // End of DEBUG
        
        [productsArray addObject:[[Products alloc] initWithProductID:pID andProductName:pName andProductDesctiption:pDescription andProductPictureID:pPictureID andProductPrice:pPrice andProductPictureURL:pPictureURL]];
        
    }

    [self.tableView reloadData];
}


@end
