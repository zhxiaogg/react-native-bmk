//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <React/RCTConvert.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import "RCT_BMKAnnotation.h"

@class RCT_BMKAnnotation;

@interface RCTConvert (BMKMapView)

+ (RCT_BMKAnnotation *)RCT_BMKAnnotation:(id)json;

+ (NSArray<RCT_BMKAnnotation *> *)RCT_BMKAnnotationArray:(id)json;

+ (BMKLogoPosition)BMKLogoPosition:(id)json;

+ (BMKMapType)BMKMapType:(id)json;

+ (BMKUserTrackingMode)BMKUserTrackingMode:(id)json;
@end