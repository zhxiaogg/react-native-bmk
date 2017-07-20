//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <React/RCTConvert.h>
#import <BaiduMapAPI_Search/BMKPoiSearchOption.h>
#import <BaiduMapAPI_Search/BMKSuggestionSearchOption.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearchOption.h>
#import <React/RCTConvert+CoreLocation.h>

@interface RCTConvert (BMKSearch)

+ (BMKNearbySearchOption *)BMKNearbySearchOption:(id)json;

+ (BMKCitySearchOption *)BMKCitySearchOption:(id)json;

+ (BMKBoundSearchOption *)BMKBoundSearchOption:(id)json;

+ (BMKPoiDetailSearchOption *)BMKPoiDetailSearchOption:(id)json;

+ (BMKPoiSortType)BMKPoiSortType:(id)json;

+ (BMKSuggestionSearchOption *)BMKSuggestionSearchOption:(id)json;

+ (BMKGeoCodeSearchOption *)BMKGeoCodeSearchOption:(id)json;

+ (BMKReverseGeoCodeOption *)BMKReverseGeoCodeOption:(id)json;

@end