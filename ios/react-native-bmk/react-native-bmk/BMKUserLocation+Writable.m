//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "BMKUserLocation+Writable.h"


@implementation BMKUserLocation (Writable)
- (void)writeUpdating:(BOOL)updating {
    [self setValue:@(updating) forKey:@"updating"];
}

- (void)writeLocation:(CLLocation *)location {
    [self setValue:location forKey:@"location"];
}

- (void)writeHeading:(CLHeading *)heading {
    [self setValue:heading forKey:@"heading"];
}

@end