//
// Created by johnzh on 17/7/17.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "BMKLocationServiceManager.h"

@implementation BMKLocationServiceManager

RCT_EXPORT_MODULE();

- (id)init {
    self = [super init];
    locationService = [[BMKLocationService alloc] init];
    locationService.delegate = self;
    return self;
}

//////////////////////////////////////////////////////////
// methods
//////////////////////////////////////////////////////////

RCT_EXPORT_METHOD(startUserLocationService) {
    [locationService startUserLocationService];
}

RCT_EXPORT_METHOD(stopUserLocationService) {
    [locationService stopUserLocationService];
}

//////////////////////////////////////////////////////////
// delegates
//////////////////////////////////////////////////////////

- (NSArray<NSString *> *)supportedEvents {
    return @[
            @"willStartLocatingUser",
            @"didStopLocatingUser",
            @"didUpdateUserHeading",
            @"didUpdateBMKUserLocation",
            @"didFailToLocateUserWithError"
    ];
}

- (void)willStartLocatingUser {
    NSLog(@"event: willStartLocatingUser");
    [self sendEventWithName:@"willStartLocatingUser" body:nil];
}

- (void)didStopLocatingUser {
    NSLog(@"event: didStopLocatingUser");
    [self sendEventWithName:@"didStopLocatingUser" body:nil];
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    NSLog(@"event: didUpdateUserHeading");
    id json = [self toJson:userLocation];
    [self sendEventWithName:@"didUpdateUserHeading" body:json];
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    NSLog(@"event: didUpdateBMKUserLocation");
    id json = [self toJson:userLocation];
    [self sendEventWithName:@"didUpdateBMKUserLocation" body:json];
}

//didFailToLocateUserWithError
//- (void)didFailToLocateUserWithError:(NSError *)error {
//    RCTMakeError
//    [self sendEventWithName:@"didUpdateBMKUserLocation" body:json];
//}

- (id)toJson:(BMKUserLocation *)userLocation {
    CLLocation *location = userLocation.location;
    CLHeading *heading = userLocation.heading;
    NSDictionary *locationJson = [self locationToJson:location];
    NSDictionary *headingJson = [self headingToJson:heading];
    id json = @{
            @"isUpdating": @(userLocation.isUpdating),
            @"location": locationJson,
            @"heading": headingJson,
            @"title": userLocation.title,
            @"subTitle": userLocation.subtitle
    };
    return json;
}

- (NSDictionary *)headingToJson:(CLHeading *)heading {
    return heading == nil ? nil : @{
            @"headingAccuracy": @(heading.headingAccuracy),
            @"magneticHeading": @(heading.magneticHeading),
            @"timestamp": @(heading.timestamp.timeIntervalSince1970),
            @"trueHeading": @(heading.trueHeading),
            @"x": @(heading.x),
            @"y": @(heading.y),
            @"z": @(heading.z)
    };
}

- (NSDictionary *)locationToJson:(CLLocation *)location {

    return location == nil ? nil : @{
            @"coordinate": @{
                    @"latitude": @(location.coordinate.latitude),
                    @"longitude": @(location.coordinate.longitude),
            },
            @"altitude": @(location.altitude),
            @"speed": @(location.speed),
            @"timestamp": @(location.timestamp.timeIntervalSince1970),
            @"horizontalAccuracy": @(location.horizontalAccuracy),
            @"verticalAccuracy": @(location.verticalAccuracy),
            @"course": @(location.course)
    };
}

//////////////////////////////////////////////////////////
// properties
//////////////////////////////////////////////////////////
// userLocation
// delegate
// distanceFilter
// desiredAccuracy
// headingFilter
// pausesLocationUpdatesAutomatically
// allowsBackgroundLocationUpdates

@end