//
//  CRSecondViewController.h
//  iOS_AR_Ch4_Sensors
//
//  Created by Ali Asghar on 10/25/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CRSecondViewController : UIViewController{
    CMMotionManager *motionManager;
    UILabel *rollLabel;
    UILabel *pitchLabel;
    UILabel *yawLabel;
    UIProgressView *rollProgressView;
    UIProgressView *pitchProgressView;
    UIProgressView *yawProgressView;
    
    NSTimer *timer;
}

@property (nonatomic, retain) CMMotionManager *motionManager;

@property (nonatomic, retain) IBOutlet UILabel *rollLabel;
@property (nonatomic, retain) IBOutlet UILabel *pitchLabel;
@property (nonatomic, retain) IBOutlet UILabel *yawLabel;

@property (nonatomic, retain) IBOutlet UIProgressView *rollProgressView;
@property (nonatomic, retain) IBOutlet UIProgressView *pitchProgressView;
@property (nonatomic, retain) IBOutlet UIProgressView *yawProgressView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)readGyroscope;
@end
