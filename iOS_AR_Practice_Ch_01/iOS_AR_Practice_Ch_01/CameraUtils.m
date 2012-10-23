//
//  CameraUtils.m
//  iOS_AR_Practice_Ch_01
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "CameraUtils.h"

@implementation CameraUtils
+(BOOL)isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

+(BOOL)isFrontCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerCameraDeviceFront];
}

+(BOOL) isVideoCameraAvailable {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    NSArray *sourceTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    
    if (![sourceTypes containsObject:(NSString *)kUTTypeMovie]){
        return NO; }
    
    return YES;
}

@end
