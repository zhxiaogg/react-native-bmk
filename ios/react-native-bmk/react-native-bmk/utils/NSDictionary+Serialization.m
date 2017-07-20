//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "NSDictionary+Serialization.h"

@implementation NSDictionary (Serialization)

+ (NSDictionary *)coordinateToDic:(CLLocationCoordinate2D)coordinate {
    return @{
            @"longitude": @(coordinate.longitude),
            @"latitude": @(coordinate.latitude)
    };
}

+ (NSDictionary *)regionToDic:(BMKCoordinateRegion)region {
    return @{
            @"center": [self coordinateToDic:region.center],
            @"span": @{
                    @"latitudeDelta": @(region.span.latitudeDelta),
                    @"longitudeDelta": @(region.span.longitudeDelta)
            }
    };
}

+ (NSDictionary *)mapPoiToDic:(BMKMapPoi *)mapPoi {
    return @{
            @"text": mapPoi.text == nil ? @"" : mapPoi.text,
            @"pt": [self coordinateToDic:mapPoi.pt],
            @"uid": mapPoi.uid == nil ? @"" : mapPoi.uid
    };
}

+ (NSDictionary *)annotationToDic:(RCT_BMKAnnotation *)annotation {
    return @{
            @"coordinate": [self coordinateToDic:annotation.coordinate],
            @"title": annotation.title ?: @"",
            @"subTitle": annotation.subtitle ?: @"",
            @"identifier": annotation.identifier ?: @""
    };
}

+ (NSDictionary *)poiResultToDic:(BMKPoiResult *)poiResult {
    NSMutableArray *poiInfoListDic;
    NSUInteger poiCount = [[poiResult poiInfoList] count];
    if (poiCount > 0) {
        poiInfoListDic = [[NSMutableArray alloc] initWithCapacity:poiCount];
        for (int i = 0; i < poiCount; ++i) {
            BMKPoiInfo *poi = [[poiResult poiInfoList] objectAtIndex:i];
            NSDictionary *dic = @{
                    @"name": [poi name] ?: @"",
                    @"uid": [poi uid] ?: @"",
                    @"address": [poi address] ?: @"",
                    @"city": [poi city] ?: @"",
                    @"phone": [poi phone] ?: @"",
                    @"postcode": [poi postcode] ?: @"",
                    @"epoitype": @([poi epoitype]),
                    @"pt": [NSDictionary coordinateToDic:[poi pt]],
                    @"panoFlag": @([poi panoFlag])
            };
            [poiInfoListDic addObject:dic];
        }
    }

    NSUInteger cityListSize = [[poiResult cityList] count];
    NSMutableArray *cityListDic;
    if (cityListSize > 0) {
        cityListDic = [[NSMutableArray alloc] initWithCapacity:cityListSize];
        for (int i = 0; i < cityListSize; ++i) {
            BMKCityListInfo *cityListInfo = [[poiResult cityList] objectAtIndex:i];
            NSDictionary *cityInfo = @{
                    @"city": [cityListInfo city] ?: @"",
                    @"num": @([cityListInfo num])
            };
            [cityListDic addObject:cityInfo];
        }
    }

    NSUInteger addressListSize = [[poiResult poiAddressInfoList] count];
    NSMutableArray *addressListDic;
    if (addressListSize > 0) {
        addressListDic = [[NSMutableArray alloc] initWithCapacity:addressListSize];
        for (int i = 0; i < addressListSize; ++i) {
            BMKPoiAddressInfo *poiAddressInfo = [[poiResult poiAddressInfoList] objectAtIndex:i];
            NSDictionary *addressInfo = @{
                    @"address": [poiAddressInfo address] ?: @"",
                    @"name": [poiAddressInfo name] ?: @"",
                    @"pt": [NSDictionary coordinateToDic:[poiAddressInfo pt]]
            };
            [addressListDic addObject:addressInfo];
        }
    }

    NSDictionary *result = @{
            @"pageIndex": @([poiResult pageIndex]),
            @"pageNum": @([poiResult pageNum]),
            @"totalPoiNum": @([poiResult totalPoiNum]),
            @"currPoiNum": @([poiResult currPoiNum]),
            @"isHavePoiAddressInfoList": @(poiResult.isHavePoiAddressInfoList),
            @"poiInfoList": poiInfoListDic ?: @[],
            @"cityList": cityListDic ?: @[],
            @"poiAddressInfoList": addressListDic ?: @[]
    };
    return result;
}

+ (NSDictionary *)poiDetailToDic:(BMKPoiDetailResult *)poiDetailResult {
    return @{
            @"name": poiDetailResult.name ?: @"",
            @"address": poiDetailResult.address ?: @"",
            @"phone": poiDetailResult.phone ?: @"",
            @"uid": poiDetailResult.uid ?: @"",
            @"tag": poiDetailResult.tag ?: @"",
            @"detailUrl": poiDetailResult.detailUrl ?: @"",
            @"type": poiDetailResult.type ?: @"",
            @"pt": [self coordinateToDic:poiDetailResult.pt],
            @"price": @(poiDetailResult.price),
            @"overallRating": @(poiDetailResult.overallRating),
            @"tasteRating": @(poiDetailResult.tasteRating),
            @"serviceRating": @(poiDetailResult.serviceRating),
            @"environmentRating": @(poiDetailResult.environmentRating),
            @"facilityRating": @(poiDetailResult.facilityRating),
            @"hygieneRating": @(poiDetailResult.hygieneRating),
            @"technologyRating": @(poiDetailResult.technologyRating),
            @"imageNum": @(poiDetailResult.imageNum),
            @"grouponNum": @(poiDetailResult.grouponNum),
            @"commentNum": @(poiDetailResult.commentNum),
            @"favoriteNum": @(poiDetailResult.favoriteNum),
            @"checkInNum": @(poiDetailResult.checkInNum),
            @"shopHours": poiDetailResult.shopHours ?: @""
    };
}

+ (NSDictionary *)suggestionResultToDic:(BMKSuggestionResult *)suggestionResult {

    NSMutableArray *ptList;
    if ([[suggestionResult ptList] count] > 0) {
        ptList = [[NSMutableArray alloc] initWithCapacity:[[suggestionResult ptList] count]];
        CLLocationCoordinate2D coord;
        for (int i = 0; i < [[suggestionResult ptList] count]; ++i) {
            NSValue *value = [[suggestionResult ptList] objectAtIndex:i];
            [value getValue:&coord];
            [ptList addObject:[NSDictionary coordinateToDic:coord]];
        }
    }

    return @{
            @"cityList": [suggestionResult cityList],
            @"keyList": [suggestionResult keyList],
            @"poiIdList": [suggestionResult poiIdList],
            @"districtList": [suggestionResult districtList],
            @"ptList": ptList ?: @[]
    };
}

+ (NSDictionary *)reverseGeocodeResultToDic:(BMKReverseGeoCodeResult *)reverseGeocodeResult {

    BMKAddressComponent *addressDetail = [reverseGeocodeResult addressDetail];
    NSDictionary *addressDetailDic = @{
            @"streetNumber": [addressDetail streetNumber] ?: @"",
            @"streetName": [addressDetail streetName] ?: @"",
            @"district": [addressDetail district] ?: @"",
            @"city": [addressDetail city] ?: @"",
            @"province": [addressDetail province] ?: @"",
            @"country": [addressDetail country] ?: @"",
            @"countryCode": [addressDetail countryCode] ?: @"",
            @"adCode": [addressDetail adCode] ?: @""
    };
    return @{
            @"address": [reverseGeocodeResult address] ?: @"",
            @"businessCircle": [reverseGeocodeResult businessCircle] ?: @"",
            @"cityCode": [reverseGeocodeResult cityCode] ?: @"",
            @"sematicDescription": [reverseGeocodeResult sematicDescription] ?: @"",
            @"location": [self coordinateToDic:[reverseGeocodeResult location]],
            @"addressDetail": addressDetailDic

    };
}

+ (NSDictionary *)geocodeResultToDic:(BMKGeoCodeResult *)geocodeResult {
    return @{
            @"location": [self coordinateToDic:[geocodeResult location]],
            @"address": [geocodeResult address] ?: @""
    };
}

@end