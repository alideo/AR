//
//  AVUtils.m
//  iOS_AR_Practice_Ch_01
//
//  Created by Ali Asghar on 10/24/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import "AVUtils.h"

@implementation AVUtils

+(BOOL)isAudioInputAvailable{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
#ifdef __IPHONE_6_0
    return audioSession.inputAvailable;
#else
    return audioSession.inputIsAvailable;
#endif
}

@end
