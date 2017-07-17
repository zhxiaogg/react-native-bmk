//
// Created by johnzh on 17/7/17.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

#import <BaiduMapAPI_Location/BMKLocationService.h>

@interface BMKLocationServiceManager : RCTEventEmitter <RCTBridgeModule, BMKLocationServiceDelegate> {
    BMKLocationService *locationService;
}

- (id)toJson:(BMKUserLocation *)userLocation;

@end
