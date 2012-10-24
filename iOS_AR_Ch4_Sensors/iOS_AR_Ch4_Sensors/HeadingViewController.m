//
//  HeadingViewController.m
//  iOS_AR_Ch4_Sensors
//
//  Created by Ali Asghar on 10/25/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "HeadingViewController.h"

@interface HeadingViewController ()

@end

@implementation HeadingViewController

@synthesize imageView;
@synthesize trueHeading;
@synthesize magneticHeading;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    locationManager = [[CLLocationManager alloc] init]; locationManager.delegate = self;
    locationManager.headingFilter = 5;
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager
                                                        headingAvailable]) {
        [locationManager startUpdatingHeading]; [locationManager startUpdatingLocation];
    } else {
        NSLog(@"Error starting location updates");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    if (newHeading.headingAccuracy > 0) {
        //float magneticHeading = newHeading.magneticHeading;
        //float trueHeading = newHeading.trueHeading;
        UIDevice *device = [UIDevice currentDevice];
        NSLog(@"%@",[self stringFromOrientation:device.orientation]);
        float magneticHeadingFloat = [self heading:newHeading.magneticHeading fromOrientation:device.orientation];
        float trueHeadingFloat = [self heading:newHeading.trueHeading fromOrientation:device.orientation];
        
        magneticHeading.text = [NSString stringWithFormat:@"%f", magneticHeadingFloat];
        trueHeading.text = [NSString stringWithFormat:@"%f", trueHeadingFloat];
        float heading = -1.0f * M_PI * newHeading.magneticHeading / 180.0f;
        imageView.transform = CGAffineTransformMakeRotation(heading); }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@",[error localizedDescription]);
}

- (float)heading:(float)heading fromOrientation:(UIDeviceOrientation)orientation {
    float correctedHeading = heading;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            correctedHeading = heading + 180.0f;
            break;
        case UIDeviceOrientationLandscapeLeft:
            correctedHeading = heading + 90.0f;
            break;
        case UIDeviceOrientationLandscapeRight:
            correctedHeading = heading - 90.0f;
            break;
        default:
        break; }
    while ( heading > 360.0f ) {
        correctedHeading = heading - 360;
    }
    return correctedHeading;
}

- (NSString *)stringFromOrientation:(UIDeviceOrientation) orientation { NSString *orientationString;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            orientationString = @"Portrait";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            orientationString = @"Portrait Upside Down";
            break;
        case UIDeviceOrientationLandscapeLeft:
            orientationString = @"Landscape Left";
            break;
        case UIDeviceOrientationLandscapeRight:
            orientationString = @"Landscape Right";
            break;
        case UIDeviceOrientationFaceUp:
            orientationString = @"Face Up";
            break;
        case UIDeviceOrientationFaceDown:
            orientationString = @"Face Down";
            break;
        case UIDeviceOrientationUnknown:
            orientationString = @"Unknown";
            break;
        default:
            orientationString = @"Not Known";
        break;
    }
    return orientationString;
}


@end
