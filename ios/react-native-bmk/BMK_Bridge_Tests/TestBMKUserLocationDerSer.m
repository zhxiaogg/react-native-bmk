//
//  TestBMKUserLocationDerSer.m
//  react-native-bmk
//
//  Created by zhangxiaog on 17/7/17.
//  Copyright © 2017年 com.johnzh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BMKLocationServiceManager.h"
#import "BMKUserLocation+JSONHelper.h"

@interface TestBMKUserLocationDerSer : XCTestCase

@end

@implementation TestBMKUserLocationDerSer

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_serialize_BMKUserLocation_into_json {
    BMKUserLocation *location = [[BMKUserLocation alloc] init];
    location.title = @"title";
    location.subtitle = @"subTitle";
    NSDictionary *dictionary = location.toDictionary;
    XCTAssertTrue([@"title" isEqualToString:dictionary[@"title"]]);
}

- (void)test_deserialize_json_into_BMKUserLocation {
    NSDictionary *dic = @{
            @"title": @"title",
            @"subTitle": @"",
            @"isUpdating": @(true),
            @"location": @{
                    @"coordinate": @{
                            @"latitude": @(40),
                            @"longitude": @(116.0)
                    },
                    @"timestamp": @(1500338451)
            },
            @"heading": [NSNull null]
    };

    BMKUserLocation *location = [[BMKUserLocation alloc] initWithDictionary:dic];
    XCTAssertTrue([@"title" isEqualToString:location.title]);
    XCTAssertTrue(40 == location.location.coordinate.latitude);
}

@end
