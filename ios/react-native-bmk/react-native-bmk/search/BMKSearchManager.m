//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "BMKSearchManager.h"
#import "NSDictionary+Serialization.h"


@implementation BMKSearchManager {
    BMKPoiSearch *_searcher;
    BMKSuggestionSearch *_suggestionSearcher;
    BMKGeoCodeSearch *_geoCodeSearcher;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _searcher = [[BMKPoiSearch alloc] init];
        _suggestionSearcher = [[BMKSuggestionSearch alloc] init];
        _geoCodeSearcher = [[BMKGeoCodeSearch alloc] init];
    }
    return self;
}

RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents {
    return @[
            @"searchPoiSuccess",
            @"searchPoiFailed",
            @"searchPoiDetailSuccess",
            @"searchPoiDetailFailed",
            @"suggestionSearchSuccess",
            @"suggestionSearchFailed",
            @"geoCodeSuccess",
            @"geoCodeFailed",
            @"reverseGeoCodeSuccess",
            @"reverseGeoCodeFailed"
    ];
}

#pragma mark POI search

RCT_EXPORT_METHOD(poiSearchNearBy:
    (BMKNearbySearchOption *) option) {
    BOOL result = [_searcher poiSearchNearBy:option];
    if (result == NO) {
        [self sendEventWithName:@"searchPoiFailed" body:nil];
    }
}

RCT_EXPORT_METHOD(poiSearchInCity:
    (BMKCitySearchOption *) option) {
    BOOL result = [_searcher poiSearchInCity:option];
    if (result == NO) {
        [self sendEventWithName:@"searchPoiFailed" body:nil];
    }
}

RCT_EXPORT_METHOD(poiSearchInbounds:
    (BMKBoundSearchOption *) option) {
    BOOL result = [_searcher poiSearchInbounds:option];
    if (result == NO) {
        [self sendEventWithName:@"searchPoiFailed" body:nil];
    }
}

RCT_EXPORT_METHOD(poiDetailSearch:
    (BMKPoiDetailSearchOption *) option) {
    BOOL result = [_searcher poiDetailSearch:option];
    if (result == NO) {
        [self sendEventWithName:@"searchPoiDetailFailed" body:nil];
    }
}

//TODO: implement POI indoor search
// RCT_EXPORT_METHOD(poiIndoorSearch)

- (void)onGetPoiDetailResult:(BMKPoiSearch *)searcher result:(BMKPoiDetailResult *)poiDetailResult errorCode:(BMKSearchErrorCode)errorCode {
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        NSDictionary *result = [NSDictionary poiDetailToDic:poiDetailResult];
        [self sendEventWithName:@"searchPoiDetailSuccess" body:result];
    } else {
        [self sendEventWithName:@"searchPoiDetailFailed" body:@{@"errorCode": @(errorCode)}];
    }
}


- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode {
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        NSDictionary *result = [NSDictionary poiResultToDic:poiResult];
        [self sendEventWithName:@"searchPoiSuccess" body:result];
    } else {
        [self sendEventWithName:@"searchPoiFailed" body:@{@"errorCode": @(errorCode)}];
    }
}

#pragma mark Suggestion search

RCT_EXPORT_METHOD(suggestionSearch:
    (BMKSuggestionSearchOption *) option) {
    BOOL result = [_suggestionSearcher suggestionSearch:option];
    if (result == NO) {
        [self sendEventWithName:@"suggestionSearchFailed" body:nil];
    }
}


- (void)onGetSuggestionResult:(BMKSuggestionSearch *)searcher result:(BMKSuggestionResult *)result errorCode:(BMKSearchErrorCode)error {
    if (error == BMK_SEARCH_NO_ERROR) {
        NSDictionary *result = [NSDictionary suggestionResultToDic:result];
        [self sendEventWithName:@"suggestionSearchSuccess" body:result];
    } else {
        [self sendEventWithName:@"suggestionSearchFailed" body:@{@"errorCode": @(error)}];
    }
}

#pragma mark Geocode search

RCT_EXPORT_METHOD(geoCode:
    (BMKGeoCodeSearchOption *) option) {
    BOOL result = [_geoCodeSearcher geoCode:option];
    if (result == NO) {
        [self sendEventWithName:@"geoCodeFailed" body:nil];
    }
}

RCT_EXPORT_METHOD(reverseGeoCode:
    (BMKReverseGeoCodeOption *) option) {
    BOOL result = [_geoCodeSearcher reverseGeoCode:option];
    if (result == NO) {
        [self sendEventWithName:@"reverseGeoCodeFailed" body:nil];
    }
}

- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    if (error == BMK_SEARCH_NO_ERROR) {
        NSDictionary *result = [NSDictionary geocodeResultToDic:result];
        [self sendEventWithName:@"geocodeSuccess" body:result];
    } else {
        [self sendEventWithName:@"geocodeFailed" body:@{@"errorCode": @(error)}];
    }
}

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    if (error == BMK_SEARCH_NO_ERROR) {
        NSDictionary *result = [NSDictionary reverseGeocodeResultToDic:result];
        [self sendEventWithName:@"reverseGeocodeSuccess" body:result];
    } else {
        [self sendEventWithName:@"reverseGeocodeFailed" body:@{@"errorCode": @(error)}];
    }
}

@end