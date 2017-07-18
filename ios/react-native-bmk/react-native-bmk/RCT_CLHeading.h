//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <CoreLocation/CLHeading.h>

@interface RCT_CLHeading : CLHeading

- initWithMagneticHeading:(CLLocationDirection)magneticHeading
              trueHeading:(CLLocationDirection)trueHeading
          headingAccuracy:(CLLocationDirection)headingAccuracy
                        x:(CLHeadingComponentValue)x
                        y:(CLHeadingComponentValue)y
                        z:(CLHeadingComponentValue)z
                timestamp:(NSDate *)timestamp;

@end