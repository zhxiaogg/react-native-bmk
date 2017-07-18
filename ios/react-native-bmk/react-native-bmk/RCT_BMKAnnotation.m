//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "RCT_BMKAnnotation.h"
#import "React/RCTConvert.h"
#import "RCTConvert+CoreLocation.h"


@implementation RCT_BMKAnnotation {
@private
    CLLocationCoordinate2D _coordinate;
    NSString *_title;
    NSString *_subTitle;
}

@synthesize coordinate = _coordinate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    _title = [RCTConvert NSString:dictionary[@"title"]];
    _subTitle = [RCTConvert NSString:dictionary[@"subTitle"]];
    _coordinate = [RCTConvert CLLocationCoordinate2D:dictionary[@"coordinate"]];
    self.identifier = [RCTConvert NSString:dictionary[@"identifier"]];
    self.image = [RCTConvert UIImage:dictionary[@"image"]];
    self.centerOffset = [RCTConvert CGPoint:dictionary[@"centerOffset"]];
    return self;
}

- (NSString *)title {
    return _title;
}

- (NSString *)subtitle {
    return _subTitle;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    self.coordinate = newCoordinate;
}


@end