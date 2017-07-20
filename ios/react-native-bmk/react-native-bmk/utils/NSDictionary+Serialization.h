//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <BaiduMapAPI_Base/BMKTypes.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Search/BMKPoiSearch.h>
#import <BaiduMapAPI_Search/BMKSuggestionSearch.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearch.h>

#import "RCT_BMKAnnotation.h"

@interface NSDictionary (Serialization)

+ (NSDictionary *)coordinateToDic:(CLLocationCoordinate2D)coordinate;

+ (NSDictionary *)regionToDic:(BMKCoordinateRegion)region;

+ (NSDictionary *)mapPoiToDic:(BMKMapPoi *)mapPoi;

+ (NSDictionary *)annotationToDic:(RCT_BMKAnnotation *)annotation;

+ (NSDictionary *)poiResultToDic:(BMKPoiResult *)poiResult;

+ (NSDictionary *)poiDetailToDic:(BMKPoiDetailResult *)poiDetailResult;

+ (NSDictionary *)suggestionResultToDic:(BMKSuggestionResult *)suggestionResult;

+ (NSDictionary *)geocodeResultToDic:(BMKGeoCodeResult *)geocodeResult;

+ (NSDictionary *)reverseGeocodeResultToDic:(BMKReverseGeoCodeResult *)reverseGeocodeResult;
@end