//
// Created by johnzh on 17/7/19.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "BMKMapManagerManager.h"


@implementation BMKMapManagerManager

RCT_EXPORT_MODULE();

- (instancetype)init {
    self = [super init];
    if (self) {
        _mapManager = [[BMKMapManager alloc] init];
    }
    return self;
}

RCT_EXPORT_METHOD(initialize:
    (NSString *) key) {

    BOOL result = [_mapManager start:key generalDelegate:self];
    if (!result) {
        NSLog(@"start map manager failed.");
        [self sendEventWithName:@"initializeFailed" body:nil];
    } else {
        [self sendEventWithName:@"initializeSuccessfully" body:nil];
    }
}

- (NSArray<NSString *> *)supportedEvents {
    return @[
            @"initializeFailed",
            @"initializeSuccessfully"
    ];
}

- (void)onGetNetworkState:(int)iError {
    // [self sendEventWithName:@"initializeFailed" body:nil];
}

- (void)onGetPermissionState:(int)iError {
    // [self sendEventWithName:@"initializeFailed" body:nil];
}


@end