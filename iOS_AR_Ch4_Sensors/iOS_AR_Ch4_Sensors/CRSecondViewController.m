//
//  CRSecondViewController.m
//  iOS_AR_Ch4_Sensors
//
//  Created by Ali Asghar on 10/25/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "CRSecondViewController.h"

@interface CRSecondViewController ()

@end

@implementation CRSecondViewController

@synthesize motionManager;
@synthesize rollLabel, rollProgressView, pitchLabel, pitchProgressView, yawLabel, yawProgressView;
@synthesize imageView;

- (void)viewDidLoad
{
    self.motionManager = [[CMMotionManager alloc] init];
    motionManager.deviceMotionUpdateInterval = 1.0/60.0;
    if (motionManager.isDeviceMotionAvailable) {
        [motionManager startDeviceMotionUpdates];
        [motionManager startGyroUpdates];
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self
                                           selector:@selector(doGyroUpdate) userInfo:nil repeats:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)readGyroscope {
    CMDeviceMotion *currentDeviceMotion = motionManager.deviceMotion;
    CMAttitude *currentAttitude = currentDeviceMotion.attitude;
    NSLog(@"Attitude: %@", currentAttitude);
    rollLabel.text = [NSString stringWithFormat:@"ROLL: %f", currentAttitude.roll];
    rollProgressView.progress = ABS(currentAttitude.roll);
    
    pitchLabel.text = [NSString stringWithFormat:@"PITCH: %f", currentAttitude.pitch];
    pitchProgressView.progress = ABS(currentAttitude.pitch);
    
    yawLabel.text = [NSString stringWithFormat:@"YAW: %f", currentAttitude.yaw];
    yawProgressView.progress = ABS(currentAttitude.yaw);
    
  
}

-(void)doGyroUpdate { 
    float rotation = 0.0;
    float rate = motionManager.gyroData.rotationRate.z;
    if (fabs(rate) > .2) {
        float direction = rate > 0 ? 1 : -1;
        rotation += direction * M_PI/90.0;
        imageView.transform = CGAffineTransformMakeRotation(rotation);
        NSLog(@"Rotation: %f", rotation);
    }
}

@end
