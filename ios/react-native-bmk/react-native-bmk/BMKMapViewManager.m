//
//  BMKMapViewManager.m
//  react-native-bmk
//
//  Created by johnzh on 17/7/17.
//  Copyright © 2017年 com.johnzh. All rights reserved.
//

#import "BMKMapViewManager.h"

#import <BaiduMapAPI_Map/BMKMapView.h>

@implementation BMKMapViewManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    return [[BMKMapView alloc] init]
}

@end
