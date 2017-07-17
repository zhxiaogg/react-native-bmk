//
//  TestBMKLocationServiceManager.m
//  react-native-bmk
//
//  Created by zhangxiaog on 17/7/17.
//  Copyright © 2017年 com.johnzh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BMKLocationServiceManager.h"

@interface TestBMKLocationServiceManager : XCTestCase

@end

@implementation TestBMKLocationServiceManager

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testToJson {
    BMKLocationServiceManager *l = [[BMKLocationServiceManager alloc] init];
    BMKUserLocation *location = [[BMKUserLocation alloc] init];
    location.subtitle = @"subTitle";
    NSDictionary *dictionary = [l toJson:location];
    NSLog([dictionary valueForKey:@"subtitle"]);
}
@end
