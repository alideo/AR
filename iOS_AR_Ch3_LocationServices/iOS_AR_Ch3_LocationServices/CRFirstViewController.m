//
//  CRFirstViewController.m
//  iOS_AR_Ch3_LocationServices
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "CRFirstViewController.h"

@interface CRFirstViewController ()

@end

@implementation CRFirstViewController

@synthesize locationTextView; // synthesize *locationTextView

- (void)viewDidLoad
{
    //Start Standard Location Service
#ifdef STANDARD_LOCATION_SERVICE
    [self startStandardUpdates];
#else
    [self startSignificantChangeUpdates];
#endif
    if ([CLLocationManager regionMonitoringAvailable]) { // check is service is available
        [self startRegionMonitoring];
    } // else do something
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    locationTextView = nil;
}

#pragma mark - Public Methods
#pragma mark Method for starting Standard Location Service
- (void)startStandardUpdates {
    locationManager = [[CLLocationManager alloc] init]; locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 500;
    [locationManager startUpdatingLocation];
}

#pragma mark Method for starting Significant-Change Location Service
- (void)startSignificantChangeUpdates {
    locationManager = [[CLLocationManager alloc] init]; locationManager.delegate = self;
    [locationManager startMonitoringSignificantLocationChanges];
}

#pragma mark Method for starting Region Monitoring
- (void)startRegionMonitoring {
    NSLog(@"Starting region monitoring");
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(37.787359, -122.408227);
    CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:coord radius:1000.0 identifier:@"San Francisco"];
#ifdef __IPHONE_6_0
    [locationManager startMonitoringForRegion:region];
#else
    [locationManager startMonitoringForRegion:region desiredAccuracy:kCLLocationAccuracyKilometer];
#endif
    
}

#pragma mark - Delegate Methods (CLLocationManagerDelegate)

#pragma mark For IOS_6
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0)
    {
        locationTextView.text = [NSString stringWithFormat:@"latitude %+.6f, longitude %+.6f\n",
                             location.coordinate.latitude, location.coordinate.longitude];
    }else{
        NSLog(@"Update Was Old");
    }
}

#pragma mark For versions less than 6
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0)
    {
//        locationTextView.text = [NSString stringWithFormat:@"latitude %+.6f, longitude %+.6f\n",
//                             newLocation.coordinate.latitude, newLocation.coordinate.longitude];
        CLLocationDistance dist = [newLocation distanceFromLocation:oldLocation] / 1000;
        locationTextView.text = [NSString stringWithFormat:@"distance %5.1f traveled",dist];
    }else{
        NSLog(@"Update Was Old");
    }
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Region Alert" message:@"You entered the region" delegate:self
                                                                                                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Region Alert"
                                                                                                                                        message:@"You exited the region" delegate:self
                                                                                                                              cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
@end
