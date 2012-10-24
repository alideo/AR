//
//  CRSecondViewController.m
//  iOS_AR_Ch3_LocationServices
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "CRSecondViewController.h"
#import "MapAnnotation.h"

@interface CRSecondViewController ()

@end

@implementation CRSecondViewController

@synthesize mapView;
@synthesize buttonBarSegmentedControl;

- (void)viewDidLoad
{
    mapView.delegate=self; [self.view addSubview:mapView];
    [NSThread detachNewThreadSelector:@selector(displayMap) toTarget:self withObject:nil];
    [self setupSegmentedControl];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupSegmentedControl {
    buttonBarSegmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray
                                                                           arrayWithObjects:@"Standard", @"Satellite", @"Hybrid", nil]];
    [buttonBarSegmentedControl setFrame:CGRectMake(30, 50, 280-30, 30)];
    buttonBarSegmentedControl.selectedSegmentIndex = 0.0; // start by showing the normal picker
    [buttonBarSegmentedControl addTarget:self action:@selector(toggleToolBarChange:) forControlEvents:UIControlEventValueChanged];
    buttonBarSegmentedControl.segmentedControlStyle = UIScrollViewIndicatorStyleWhite;
    buttonBarSegmentedControl.backgroundColor = [UIColor clearColor];
    buttonBarSegmentedControl.tintColor = [UIColor blackColor];
    [buttonBarSegmentedControl setAlpha:0.8];
    [self.view addSubview:buttonBarSegmentedControl];
}

- (void)displayMap {
    CLLocationCoordinate2D coords;
    coords.latitude = 31.503538;
    coords.longitude = 74.279509;
    MKCoordinateRegion region;
#ifdef __IPHONE_6_0
    region = MKCoordinateRegionMakeWithDistance(coords, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
#else
    MKCoordinateSpan span = MKCoordinateSpanMake(0.002389, 0.005681);
    region =MKCoordinateRegionMake(coords, span);
#endif
    MapAnnotation *addAnnotation = [[MapAnnotation alloc] initWithCoordinate:coords];
    [addAnnotation setTitle:@"My Street"];
    [addAnnotation setSubTitle:@"this is in front of my home"];
    [mapView addAnnotation:addAnnotation];
    
    [mapView setRegion:region animated:YES];
}

- (void)toggleToolBarChange:(id)sender
{
    UISegmentedControl *segControl = sender;
    switch (segControl.selectedSegmentIndex) {
        case 0: // Map
        {
            [mapView setMapType:MKMapTypeStandard];
            break;
        }
        case 1: {
            // Satellite
            [mapView setMapType:MKMapTypeSatellite];
            break;
        }
        case 2: {
            // Hybrid
            [mapView setMapType:MKMapTypeHybrid];
            break;
        }
    }
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"MyPin"];
    annView.animatesDrop=TRUE;
    annView.canShowCallout = YES;
    [annView setSelected:YES];
    annView.pinColor = MKPinAnnotationColorPurple;
    annView.calloutOffset = CGPointMake(-50, 5);
    return annView;
}

@end
