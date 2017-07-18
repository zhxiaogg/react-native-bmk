//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Base/BMKUserLocation.h>

@interface BMKUserLocation (JSONHelper)
- (BMKUserLocation *)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;
@end