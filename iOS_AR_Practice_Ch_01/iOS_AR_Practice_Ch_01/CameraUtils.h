//
//  CameraUtils.h
//  iOS_AR_Practice_Ch_01
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface CameraUtils : NSObject

+(BOOL)isCameraAvailable;
+(BOOL)isFrontCameraAvailable;
+(BOOL)isVideoCameraAvailable;

@end
