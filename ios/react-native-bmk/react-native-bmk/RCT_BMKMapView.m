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
    NSMutableArray<RCT_BMKAnnotation *> *annotationsToAdd = [[NSMutableArray alloc] init];
    NSMutableArray<RCT_BMKAnnotation *> *annotaitonsToDel = [[NSMutableArray alloc] init];
    NSMutableArray<NSString *> *validAnnotationIds;

    NSUInteger num = [annotations count];
    if (num > 0) {
        validAnnotationIds = [[NSMutableArray alloc] initWithCapacity:num];
        for (int i = 0; i < num; ++i) {
            RCT_BMKAnnotation *annotation = [annotations objectAtIndex:i];
            NSString *identifier = [annotation identifier];
            if ([identifier length] == 0) {
                [annotationsToAdd addObject:annotation];
            } else if (![_annotationIds containsObject:identifier]) {
                [annotationsToAdd addObject:annotation];
                [validAnnotationIds addObject:identifier];
            }
        }
    }

    //
    [_annotationIds removeObjectsInArray:validAnnotationIds];
    if ([[self annotations] count] > 0) {
        for (int i = 0; i < [[self annotations] count]; ++i) {
            RCT_BMKAnnotation *annotation = [[self annotations] objectAtIndex:i];
            NSString *identifier = [annotation identifier];
            if ([identifier length] == 0 || [_annotationIds containsObject:identifier]) {
                [annotaitonsToDel addObject:annotation];
            }
        }
    }
    _annotationIds = validAnnotationIds;

    if ([annotaitonsToDel count] > 0) {
        [self removeAnnotations:annotaitonsToDel];
    }

    if ([annotationsToAdd count] > 0) {
        [self addAnnotations:annotationsToAdd];
    }
}

@end