//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "RCTConvert+BMKMapView.h"

@implementation RCTConvert (BMKMapView)

RCT_ARRAY_CONVERTER(RCT_BMKAnnotation)

+ (RCT_BMKAnnotation *)RCT_BMKAnnotation:(id)json {
    json = [self NSDictionary:json];
    return [[RCT_BMKAnnotation alloc] initWithDictionary:json];
}

RCT_ENUM_CONVERTER(
        BMKLogoPosition,
        (@{
                @"BMKLogoPositionLeftBottom": @(BMKLogoPositionLeftBottom),
                @"BMKLogoPositionLeftTop": @(BMKLogoPositionLeftTop),
                @"BMKLogoPositionCenterBottom": @(BMKLogoPositionCenterBottom),
                @"BMKLogoPositionCenterTop": @(BMKLogoPositionCenterTop),
                @"BMKLogoPositionRightBottom": @(BMKLogoPositionRightBottom),
                @"BMKLogoPositionRightTop": @(BMKLogoPositionRightTop)
        }),
        BMKLogoPositionLeftBottom,
        integerValue)

RCT_ENUM_CONVERTER(
        BMKMapType,
        (@{
                @"BMKMapTypeNone": @(BMKMapTypeNone),
                @"BMKMapTypeStandard": @(BMKMapTypeStandard),
                @"BMKMapTypeSatellite": @(BMKMapTypeSatellite)
        }),
        BMKMapTypeStandard,
        integerValue)

RCT_ENUM_CONVERTER(
        BMKUserTrackingMode,
        (@{
                @"BMKUserTrackingModeNone": @(BMKUserTrackingModeNone),
                @"BMKUserTrackingModeHeading": @(BMKUserTrackingModeHeading),
                @"BMKUserTrackingModeFollow": @(BMKUserTrackingModeFollow),
                @"BMKUserTrackingModeFollowWithHeading": @(BMKUserTrackingModeFollowWithHeading)
        }),
        BMKUserTrackingModeNone,
        integerValue)
@end

