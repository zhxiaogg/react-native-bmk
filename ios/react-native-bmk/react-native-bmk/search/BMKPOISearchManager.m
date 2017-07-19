//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "BMKPOISearchManager.h"
#import "NSDictionary+Serialization.h"


@implementation BMKPOISearchManager {
    BMKPoiSearch *_searcher;
}

RCT_EXPORT_MODULE()

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

- (NSArray<NSString *> *)supportedEvents {
    return @[
            @"searchPoiSuccess",
            @"searchPoiFailed",
            @"searchPoiDetailSuccess",
            @"searchPoiDetailFailed"
    ];
}

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
@end