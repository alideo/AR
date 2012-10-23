//
//  CRViewController.m
//  iOS_AR_Practice_Ch_01
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "CRViewController.h"
#import "CameraUtils.h"
#import "MagnetometerUtils.h"

@interface CRViewController ()

@end

@implementation CRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if([CameraUtils isCameraAvailable]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera" message:@"Camera Is Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera" message:@"Camera Is Not Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    if([CameraUtils isFrontCameraAvailable]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera" message:@"Front Camera Is Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera" message:@"Front Camera Is Not Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    if([MagnetometerUtils isAvailable]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Magnetometer" message:@"Magnetometer Is Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Magnetometer" message:@"Magnetometer Is Not Available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
