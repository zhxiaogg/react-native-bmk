//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "CLHeadingImpl.h"

@implementation CLHeadingImpl {
    CLLocationDirection _magneticHeading;
    CLLocationDirection _trueHeading;
    CLLocationDirection _headingAccuracy;
    CLHeadingComponentValue _x;
    CLHeadingComponentValue _y;
    CLHeadingComponentValue _z;
    NSDate *_timestamp;
}

@synthesize  magneticHeading = _magneticHeading;
@synthesize  trueHeading = _trueHeading;
@synthesize  headingAccuracy = _headingAccuracy;
@synthesize  x = _x;
@synthesize  y = _y;
@synthesize  z = _z;
@synthesize  timestamp = _timestamp;

- initWithMagneticHeading:(CLLocationDirection)magneticHeading
              trueHeading:(CLLocationDirection)trueHeading
          headingAccuracy:(CLLocationDirection)headingAccuracy
                        x:(CLHeadingComponentValue)x
                        y:(CLHeadingComponentValue)y
                        z:(CLHeadingComponentValue)z
                timestamp:(NSDate *)timestamp {
    _magneticHeading = magneticHeading;
    _trueHeading = trueHeading;
    _headingAccuracy = headingAccuracy;
    _x = x;
    _y = y;
    _z = z;
    _timestamp = timestamp;
    return self;
}
@end