//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <BaiduMapAPI_Search/BMKPoiSearch.h>
#import <BaiduMapAPI_Search/BMKGeocodeSearch.h>
#import <BaiduMapAPI_Search/BMKSuggestionSearch.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import "BMKSuggestionSearch.h"

@interface BMKSearchManager : RCTEventEmitter <RCTBridgeModule, BMKPoiSearchDelegate,BMKGeoCodeSearchDelegate,BMKSuggestionSearchDelegate>

@end