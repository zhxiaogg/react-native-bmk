//
//  BMKMapViewManager.m
//  react-native-bmk
//
//  Created by johnzh on 17/7/17.
//  Copyright © 2017年 com.johnzh. All rights reserved.
//

#import "BMKMapViewManager.h"
#import "BMKUserLocation+JSONHelper.h"
#import "RCT_BMKMapView.h"

@implementation BMKMapViewManager {

}

RCT_EXPORT_MODULE()

- (UIView *)view {
    RCT_BMKMapView *mapView = [[RCT_BMKMapView alloc] init];
    mapView.delegate = self;
    return mapView;
}

#pragma mark properties
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
//TODO: use RCT_EXPORT_VIEW_PROPERTY
RCT_CUSTOM_VIEW_PROPERTY(userLocation, BMKUserLocation, RCT_BMKMapView) {
    NSDictionary *dictionary = [RCTConvert NSDictionary:json];
    BMKUserLocation *location = [[BMKUserLocation alloc] initWithDictionary:dictionary];
    [view updateLocationData:location];
}

#pragma mark event callbacks

RCT_EXPORT_VIEW_PROPERTY(onDidFinishLoading, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onDidFinishRendering, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onRegionWillChange, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onRegionDidChange, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onDidAddAnnotationViews, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onDidSelectAnnotationView, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onDidDeselectAnnotationView, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onClickedMapPoi, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onClickedMapBlank, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onDoubleClick, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onLongClick, RCTBubblingEventBlock)

RCT_EXPORT_VIEW_PROPERTY(onMapStatusDidChanged, RCTBubblingEventBlock)

- (void)mapViewDidFinishLoading:(RCT_BMKMapView *)mapView {
    if (!mapView.onDidFinishLoading) {
        return;
    }
    mapView.onDidFinishLoading(nil);
}

- (void)mapViewDidFinishRendering:(RCT_BMKMapView *)mapView {
    if (!mapView.onDidFinishRendering) {
        return;
    }
    mapView.onDidFinishRendering(nil);
}

- (void)mapView:(RCT_BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    if (!mapView.onRegionWillChange) {
        return;
    }
    mapView.onRegionWillChange([self regionToDic:mapView.region]);
}

- (void)mapView:(RCT_BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    if (!mapView.onRegionDidChange) {
        return;
    }
    mapView.onRegionDidChange([self regionToDic:mapView.region]);
}

//TODO: send annotation view back
- (void)mapView:(RCT_BMKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    if (!mapView.onDidAddAnnotationViews) {
        return;
    }
    mapView.onDidAddAnnotationViews(nil);
}

- (void)mapView:(RCT_BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
    if (!mapView.onDidSelectAnnotationView) {
        return;
    }
    mapView.onDidSelectAnnotationView(nil);
}

- (void)mapView:(RCT_BMKMapView *)mapView didDeselectAnnotationView:(BMKAnnotationView *)view {
    if (!mapView.onDidDeselectAnnotationView) {
        return;
    }
    mapView.onDidDeselectAnnotationView(nil);
}

- (void)mapView:(RCT_BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi *)mapPoi {
    if (!mapView.onClickedMapPoi) {
        return;
    }
    mapView.onClickedMapPoi([self mapPoiToDic:mapPoi]);
}

- (void)mapView:(RCT_BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate {
    if (!mapView.onClickedMapBlank) {
        return;
    }
    mapView.onClickedMapBlank([self coordinateToDic:coordinate]);
}

- (void)mapview:(RCT_BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate {
    if (!mapView.onDoubleClick) {
        return;
    }
    mapView.onDoubleClick([self coordinateToDic:coordinate]);
}

- (void)mapview:(RCT_BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate {
    if (!mapView.onLongClick) {
        return;
    }
    mapView.onLongClick([self coordinateToDic:coordinate]);
}

//TODO: send map status back
- (void)mapStatusDidChanged:(RCT_BMKMapView *)mapView {
    if (!mapView.onMapStatusDidChanged) {
        return;
    }
    mapView.onMapStatusDidChanged(nil);
}

// helper functions:
- (NSDictionary *)coordinateToDic:(CLLocationCoordinate2D)coordinate {
    return @{
            @"longitude": @(coordinate.longitude),
            @"latitude": @(coordinate.latitude)
    };
}

- (NSDictionary *)regionToDic:(BMKCoordinateRegion)region {
    return @{
            @"center": [self coordinateToDic:region.center],
            @"span": @{
                    @"latitudeDelta": @(region.span.latitudeDelta),
                    @"longitudeDelta": @(region.span.longitudeDelta)
            }
    };
}

- (NSDictionary *)mapPoiToDic:(BMKMapPoi *)mapPoi {
    return @{
            @"text": mapPoi.text == nil ? @"" : mapPoi.text,
            @"pt": [self coordinateToDic:mapPoi.pt],
            @"uid": mapPoi.uid == nil ? @"" : mapPoi.uid
    };
}

#pragma mark Annotation API

RCT_EXPORT_VIEW_PROPERTY(annotations, NSArray<RCT_BMKAnnotation> *)

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
    if (![annotation isKindOfClass:[RCT_BMKAnnotation class]]) {
        return nil;
    }
    RCT_BMKAnnotation *annotation1 = annotation;
    NSString *reuseIdentifier = NSStringFromClass([BMKAnnotationView class]);
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
    if (!annotationView) {
        annotationView = [[BMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    }
    annotationView.image = annotation1.image;
    annotationView.center = annotation1.centerOffset;
    return annotationView;
}


@end