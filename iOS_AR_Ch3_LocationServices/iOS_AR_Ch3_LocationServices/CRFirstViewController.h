//
//  CRFirstViewController.h
//  iOS_AR_Ch3_LocationServices
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#define STANDARD_LOCATION_SERVICE

@interface CRFirstViewController : UIViewController<CLLocationManagerDelegate>{
    UITextView *locationTextView;
    CLLocationManager *locationManager;
}

@property (nonatomic, retain) IBOutlet UITextView *locationTextView;

- (void)startStandardUpdates;
- (void)startSignificantChangeUpdates;

- (void)startRegionMonitoring;

@end
