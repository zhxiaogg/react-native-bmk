//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <BaiduMapAPI_Base/BMKUserLocation.h>

@interface BMKUserLocation (Writable)

- (void)writeUpdating:(BOOL)updating;

- (void)writeLocation:(CLLocation *)location;

- (void)writeHeading:(CLHeading *)heading;

@end