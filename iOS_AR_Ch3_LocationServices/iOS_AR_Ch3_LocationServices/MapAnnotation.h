//
//  MapAnnotation.h
//  iOS_AR_Ch3_LocationServices
//
//  Created by Ali Asghar on 10/25/12.
//  Copyright (c) 2012 Ali Asghar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject<MKAnnotation>{
    CLLocationCoordinate2D coordinate;
    NSString *subtitletext;
    NSString *titletext;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate; @property (readwrite, retain) NSString *titletext;
@property (readwrite, retain) NSString *subtitletext; -(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;
- (NSString *)subtitle;
- (NSString *)title; -(void)setTitle:(NSString*)strTitle; -(void)setSubTitle:(NSString*)strSubTitle;

@end
