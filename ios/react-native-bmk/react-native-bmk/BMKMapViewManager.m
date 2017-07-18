//
//  BMKMapViewManager.m
//  react-native-bmk
//
//  Created by johnzh on 17/7/17.
//  Copyright © 2017年 com.johnzh. All rights reserved.
//

#import "BMKMapViewManager.h"
#import "BMKUserLocation+Writable.h"
#import "BMKUserLocation+JSONHelper.h"
#import <BaiduMapAPI_Map/BMKMapView.h>

@implementation BMKMapViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[BMKMapView alloc] init];
}

//////////////////////////////////////////////////////////
// properties
//////////////////////////////////////////////////////////

// property delegate
// property mapType
RCT_EXPORT_VIEW_PROPERTY(mapType, BMKMapType)

// property region
// property limitMapRegion
// property compassPosition
// property compassSize
// property centerCoordinate
RCT_EXPORT_VIEW_PROPERTY(centerCoordinate, CLLocationCoordinate2D)
// property zoomLevel
RCT_EXPORT_VIEW_PROPERTY(zoomLevel, float)
// property minZoomLevel
// property maxZoomLevel
// property rotation
// property overlooking
// property buildingsEnabled
// property showMapPoi
RCT_EXPORT_VIEW_PROPERTY(showMapPoi, BOOL)
// property trafficEnabled
// property baiduHeatMapEnabled
// property gesturesEnabled
// property zoomEnabled
RCT_EXPORT_VIEW_PROPERTY(zoomEnabled, BOOL)
// property zoomEnabledWithTap
RCT_EXPORT_VIEW_PROPERTY(zoomEnabledWithTap, BOOL)
// property scrollEnabled
// property overlookEnabled
// property rotateEnabled
// property forceTouchEnabled
// property showMapScaleBar
RCT_EXPORT_VIEW_PROPERTY(showMapScaleBar, BOOL)
// property mapScaleBarPosition
// property mapScaleBarSize
// property logoPosition
RCT_EXPORT_VIEW_PROPERTY(logoPosition, BMKLogoPosition)
// property visibleMapRect
// property mapPadding
// property updateTargetScreenPtWhenMapPaddingChanged
// property ChangeWithTouchPointCenterEnabled


#pragma mark LocationViewAPI

// property BOOL showsUserLocation;
RCT_EXPORT_VIEW_PROPERTY(showsUserLocation, BOOL)
// property BMKUserTrackingMode userTrackingMode;
RCT_EXPORT_VIEW_PROPERTY(userTrackingMode, BMKUserTrackingMode)

// method -(void)updateLocationData:(BMKUserLocation*)userLocation;
RCT_CUSTOM_VIEW_PROPERTY(userLocation, BMKUserLocation, BMKMapView) {
    NSDictionary *dictionary = [RCTConvert NSDictionary:json];
    BMKUserLocation *location = [[BMKUserLocation alloc] initWithDictionary:dictionary];
    [view updateLocationData:location];
}
@end

@implementation RCTConvert (BMKUserTrackingMode)

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

@implementation RCTConvert (BMKMapType)

RCT_ENUM_CONVERTER(
        BMKMapType,
        (@{
                @"BMKMapTypeNone": @(BMKMapTypeNone),
                @"BMKMapTypeStandard": @(BMKMapTypeStandard),
                @"BMKMapTypeSatellite": @(BMKMapTypeSatellite)
        }),
        BMKMapTypeStandard,
        integerValue)

@end

@implementation RCTConvert (BMKLogoPosition)

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
@end

@implementation RCTConvert (CLLocationCoordinate2D)
RCT_CONVERTER(CLLocationDegrees, CLLocationDegrees, doubleValue)

RCT_CONVERTER(CLLocationDistance, CLLocationDistance, doubleValue)

+ (CLLocationCoordinate2D)CLLocationCoordinate2D:(id)json {
    json = [self NSDictionary:json];
    return (CLLocationCoordinate2D) {
            [self CLLocationDegrees:json[@"latitude"]],
            [self CLLocationDegrees:json[@"longitude"]]
    };
}
@end