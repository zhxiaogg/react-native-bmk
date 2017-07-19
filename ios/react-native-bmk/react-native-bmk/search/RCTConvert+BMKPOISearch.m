//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "RCTConvert+BMKPOISearch.h"
#import "RCTConvert+CoreLocation.h"


@implementation RCTConvert (BMKPOISearch)

+ (BMKNearbySearchOption *)BMKNearbySearchOption:(id)json {
    json = [self NSDictionary:json];
    BMKNearbySearchOption *option = [[BMKNearbySearchOption alloc] init];
    option.location = [self CLLocationCoordinate2D:json[@"location"]];
    option.radius = [self NSInteger:json[@"radius"]];
    option.keyword = [self NSString:json[@"keyword"]];
    option.sortType = [self BMKPoiSortType:json[@"sortType"]];
    option.pageIndex = [self NSInteger:json[@"pageIndex"]];
    option.pageCapacity = [self NSInteger:json[@"pageCapacity"]];
    return option;
}

+ (BMKBoundSearchOption *)BMKBoundSearchOption:(id)json {
    json = [self NSDictionary:json];
    BMKBoundSearchOption *option = [[BMKBoundSearchOption alloc] init];
    option.leftBottom = [self CLLocationCoordinate2D:json[@"leftBottom"]];
    option.rightTop = [self CLLocationCoordinate2D:json[@"rightTop"]];
    option.keyword = [self NSString:json[@"keyword"]];
    option.pageIndex = [self NSInteger:json[@"pageIndex"]];
    option.pageCapacity = [self NSInteger:json[@"pageCapacity"]];
    return option;
}

+ (BMKCitySearchOption *)BMKCitySearchOption:(id)json {
    json = [self NSDictionary:json];
    BMKCitySearchOption *option = [[BMKCitySearchOption alloc] init];
    option.city = [self NSString:json[@"city"]];
    option.requestPoiAddressInfoList = [self BOOL:json[@"requestPoiAddressInfoList"]];
    option.keyword = [self NSString:json[@"keyword"]];
    option.pageIndex = [self NSInteger:json[@"pageIndex"]];
    option.pageCapacity = [self NSInteger:json[@"pageCapacity"]];
    return option;
}

+ (BMKPoiDetailSearchOption *)BMKPoiDetailSearchOption:(id)json {
    json = [self NSDictionary:json];
    BMKPoiDetailSearchOption *option = [[BMKPoiDetailSearchOption alloc] init];
    option.poiUid = [self NSString:json[@"poiUid"]];
    return option;
}

RCT_ENUM_CONVERTER(
        BMKPoiSortType,
        (@{
                @"BMK_POI_SORT_BY_COMPOSITE": @(BMK_POI_SORT_BY_COMPOSITE),
                @"BMK_POI_SORT_BY_DISTANCE": @(BMK_POI_SORT_BY_DISTANCE)
        }),
        BMK_POI_SORT_BY_COMPOSITE,
        integerValue)

@end