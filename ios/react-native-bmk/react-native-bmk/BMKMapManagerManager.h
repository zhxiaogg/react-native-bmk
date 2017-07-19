//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <BaiduMapAPI_Base/BMKMapManager.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface BMKMapManagerManager : RCTEventEmitter <RCTBridgeModule, BMKGeneralDelegate> {
@private
    BMKMapManager *_mapManager;
}
@end