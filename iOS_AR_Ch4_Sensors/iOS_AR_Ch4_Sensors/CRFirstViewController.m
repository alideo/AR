//
//  CRFirstViewController.m
//  iOS_AR_Ch4_Sensors
//
//  Created by Ali Asghar on 10/25/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "CRFirstViewController.h"

@interface CRFirstViewController ()

@end

@implementation CRFirstViewController

@synthesize xLabel, yLabel, zLabel, xProgressView, yProgressView, zProgressView, accelerometer;

- (void)viewDidLoad
{
    accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = .5;
    accelerometer.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    xLabel.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
    yLabel.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
    zLabel.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
    
    xProgressView.progress = ABS(acceleration.x);
    yProgressView.progress = ABS(acceleration.y);
    zProgressView.progress = ABS(acceleration.z);
    
    double const kThreshold = 2.0; // 2Gs is typical to measure shaking
    if(ABS(acceleration.x) > kThreshold || ABS(acceleration.y) > kThreshold || ABS(acceleration.z) > kThreshold) {
//        if shake is detected across any axis
        NSLog(@"Shake Detected!"); // Log it!
    }
}

@end
