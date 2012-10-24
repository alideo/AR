//
//  CRSecondViewController.h
//  iOS_AR_Ch3_LocationServices
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface CRSecondViewController : UIViewController<MKMapViewDelegate>{
    IBOutlet MKMapView *mapView;
    UISegmentedControl *buttonBarSegmentedControl;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *buttonBarSegmentedControl;

- (void)setupSegmentedControl;

@end
