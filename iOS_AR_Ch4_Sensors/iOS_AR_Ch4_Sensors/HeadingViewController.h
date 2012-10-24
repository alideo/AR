//
//  HeadingViewController.h
//  iOS_AR_Ch4_Sensors
//
//  Created by Ali Asghar on 10/25/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface HeadingViewController : UIViewController<CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *trueHeading;
@property (strong, nonatomic) IBOutlet UILabel *magneticHeading;

//Helper Methods
- (float)heading:(float)heading fromOrientation:(UIDeviceOrientation) orientation;
- (NSString *)stringFromOrientation:(UIDeviceOrientation) orientation;


@end
