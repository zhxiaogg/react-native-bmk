//
// Created by johnzh on 17/7/17.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "BMKLocationServiceManager.h"
#import "BMKUserLocation+JSONHelper.h"

/**
 * TODO: 1. support multiple location service
 * TODO: 2. optimize event emitter by reducing unnecessary events
 */
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
    [self sendEventWithName:@"willStartLocatingUser" body:nil];
}

- (void)didStopLocatingUser {
    [self sendEventWithName:@"didStopLocatingUser" body:nil];
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    id json = [userLocation toDictionary];
    [self sendEventWithName:@"didUpdateUserHeading" body:json];
}

- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    id json = [userLocation toDictionary];
    [self sendEventWithName:@"didUpdateBMKUserLocation" body:json];
}

//didFailToLocateUserWithError
//- (void)didFailToLocateUserWithError:(NSError *)error {
//    RCTMakeError
//    [self sendEventWithName:@"didUpdateBMKUserLocation" body:json];
//}


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
