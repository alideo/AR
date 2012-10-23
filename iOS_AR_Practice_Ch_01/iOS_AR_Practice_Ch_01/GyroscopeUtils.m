//
//  GyroscopeUtils.m
//  iOS_AR_Practice_Ch_01
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "GyroscopeUtils.h"
#import <CoreMotion/CoreMotion.h>

@implementation GyroscopeUtils
+(BOOL) isGyroscopeAvailable {
#ifdef __IPHONE_4_0
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    return motionManager.gyroAvailable;
#else
    return NO;
#endif 
}
@end
