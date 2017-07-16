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

- (UIView *)view
{
    return [[BMKMapView alloc] init]
}

@end
