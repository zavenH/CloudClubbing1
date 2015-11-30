//
//  ContactView.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 03/09/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContactView : UIViewController{
    MKMapView *mapView;
    
    NSArray *infos;
    NSMutableData *data;
    
    IBOutlet UILabel *Name;
    IBOutlet UILabel *Description;
    IBOutlet UILabel *Street;
    IBOutlet UILabel *ZIP;
    IBOutlet UILabel *City;
    IBOutlet UILabel *Country;
    IBOutlet UILabel *Telephone;
    IBOutlet UILabel *Website;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)setMap:(id)sender;

@property (nonatomic, copy) NSDictionary *infosLabels;

@property (strong, nonatomic) NSMutableArray *jsonMutableArray;
@property (strong, nonatomic) NSMutableArray *contactArray;





@end
