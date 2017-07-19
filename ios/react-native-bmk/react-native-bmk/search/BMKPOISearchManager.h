//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <BaiduMapAPI_Search/BMKPoiSearch.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface BMKPOISearchManager : RCTEventEmitter <RCTBridgeModule, BMKPoiSearchDelegate>

@end