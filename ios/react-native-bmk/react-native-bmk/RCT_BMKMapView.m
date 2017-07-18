//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import "RCT_BMKMapView.h"

@implementation RCT_BMKMapView

- (instancetype)init {
    self = [super init];
    _annotationIds = [[NSMutableArray alloc] init];
    return self;
}

- (void)setAnnotations:(NSArray <RCT_BMKAnnotation *> *)annotations {
    // [view removeAnnotations:annotations];
    // convert json to annotations
    // update viewForAnnotation behavior
    // add new annotations
    NSMutableArray<RCT_BMKAnnotation *> *annotationsToAdd = [[NSMutableArray alloc] init];
    NSMutableArray<RCT_BMKAnnotation *> *annotaitonsToDel = [[NSMutableArray alloc] init];

    //TODO: implement this

    if (annotaitonsToDel.count > 0) {
        [self removeAnnotations:annotaitonsToDel];
    }

    if (annotationsToAdd.count > 0) {
        [self addAnnotations:annotationsToAdd];
    }
}

@end