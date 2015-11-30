//
//  ContactView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 03/09/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "ContactView.h"
#import "ContactInfo.h"
#import "SWRevealViewController.h"

#import <MapKit/MapKit.h>

#define jsonContactURL @"http://163.5.84.210/api/nightclub/fb_profile.php?id=1"

@interface ContactView ()

@end

@implementation ContactView

@synthesize mapView = _mapView;
@synthesize infosLabels;
@synthesize jsonMutableArray, contactArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self retrieveData];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            _mapView.mapType = MKMapTypeHybrid;
        default:
            break;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 48.869911;
    zoomLocation.longitude = 2.33208;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 750, 750);
    
    [_mapView setRegion:viewRegion animated:YES];
    
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = zoomLocation;
    point.title = Name.text;
    
    [_mapView addAnnotation:point];
}

- (void) retrieveData{
    NSURL *url = [NSURL URLWithString:jsonContactURL];
    
    NSData *data2 = [NSData dataWithContentsOfURL:url];
    jsonMutableArray = [NSJSONSerialization JSONObjectWithData:data2 options:NSJSONReadingMutableContainers error:nil];
    
    // DEBUG Dictionary
    // NSLog(@"%@", jsonMutableArray);
    // NSLog(@"--count%lu--",(unsigned long)jsonMutableArray.count);
    // End DEBUG
    
    Name.text = [[jsonMutableArray  valueForKeyPath:@"Nightclub"] objectForKey:@"Name"];
    Description.text = [[jsonMutableArray  valueForKeyPath:@"Nightclub"] objectForKey:@"Description"];
    Street.text = [[jsonMutableArray  valueForKeyPath:@"Nightclub"] objectForKey:@"Street"];
    ZIP.text = [[jsonMutableArray valueForKeyPath:@"Nightclub"] objectForKey:@"ZIP"];
    City.text = [[jsonMutableArray valueForKeyPath:@"Nightclub"] objectForKey:@"City"];
    Country.text = [[jsonMutableArray valueForKeyPath:@"Nightclub"] objectForKey:@"Country"];
    Telephone.text = [[jsonMutableArray valueForKeyPath:@"Nightclub"] objectForKey:@"Phone"];
    Website.text = [[jsonMutableArray valueForKeyPath:@"Nightclub"] objectForKey:@"Website"];

}

@end
