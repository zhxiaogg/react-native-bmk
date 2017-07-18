//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "BMKUserLocation+JSONHelper.h"
#import "BMKUserLocation+Writable.h"
#import "RCT_CLHeading.h"


@implementation BMKUserLocation (JSONHelper)

- (BMKUserLocation *)initWithDictionary:(NSDictionary *)dictionary {
    self.title = dictionary[@"title"];
    self.subtitle = dictionary[@"subTitle"];
    [self writeUpdating:[dictionary[@"isUpdating"] boolValue]];
    NSDictionary *locationDic = [dictionary valueForKey:@"location"];
    if ((id) locationDic != [NSNull null]) {
        NSDictionary *coordDic = [locationDic valueForKey:@"coordinate"];
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([coordDic[@"latitude"] doubleValue], [coordDic[@"longitude"] doubleValue]);
        CLLocationDistance altitude = [locationDic[@"altitude"] doubleValue];
        CLLocationAccuracy hAccuracy = [locationDic[@"horizontalAccuracy"] doubleValue];
        CLLocationAccuracy vAccuracy = [locationDic[@"verticalAccuracy"] doubleValue];
        CLLocationDirection course = [locationDic[@"course"] doubleValue];
        CLLocationSpeed speed = [locationDic[@"speed"] doubleValue];
        NSDate *timestamp = [[NSDate alloc] initWithTimeIntervalSince1970:[locationDic[@"timestamp"] doubleValue]];
        CLLocation *location = [[CLLocation alloc] initWithCoordinate:coordinate altitude:altitude horizontalAccuracy:hAccuracy verticalAccuracy:vAccuracy course:course speed:speed timestamp:timestamp];
        [self writeLocation:location];
    }
    NSDictionary *headingDic = [dictionary valueForKey:@"heading"];
    if ((id) headingDic != [NSNull null]) {
        CLLocationDirection magneticHeading = [headingDic[@"magneticHeading"] doubleValue];
        CLLocationDirection trueHeading = [headingDic[@"trueHeading"] doubleValue];
        CLLocationDirection headingAccuracy = [headingDic[@"headingAccuracy"] doubleValue];
        CLHeadingComponentValue x = [headingDic[@"x"] doubleValue];
        CLHeadingComponentValue y = [headingDic[@"y"] doubleValue];
        CLHeadingComponentValue z = [headingDic[@"z"] doubleValue];
        NSDate *timestamp = [[NSDate alloc] initWithTimeIntervalSince1970:[headingDic[@"timestamp"] doubleValue]];
        CLHeading *heading = [[RCT_CLHeading alloc] initWithMagneticHeading:magneticHeading trueHeading:trueHeading headingAccuracy:headingAccuracy x:x y:y z:z timestamp:timestamp];
        [self writeHeading:heading];
    }
    return self;
}

- (NSDictionary *)toDictionary {
    CLLocation *location = self.location;
    CLHeading *heading = self.heading;
    NSDictionary *locationJson = [self locationToJson:location];
    NSDictionary *headingJson = [self headingToJson:heading];
    NSDictionary *json = @{
            @"isUpdating": @(self.isUpdating),
            @"location": locationJson,
            @"heading": headingJson,
            @"title": self.title == nil ? @"" : self.title,
            @"subTitle": self.subtitle == nil ? @"" : self.subtitle
    };
    return json;
}

- (id)headingToJson:(CLHeading *)heading {
    return heading == nil ? [NSNull null] : @{
            @"headingAccuracy": @(heading.headingAccuracy),
            @"magneticHeading": @(heading.magneticHeading),
            @"timestamp": @(heading.timestamp.timeIntervalSince1970),
            @"trueHeading": @(heading.trueHeading),
            @"x": @(heading.x),
            @"y": @(heading.y),
            @"z": @(heading.z)
    };
}

- (id)locationToJson:(CLLocation *)location {

    return location == nil ? [NSNull null] : @{
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
@end
