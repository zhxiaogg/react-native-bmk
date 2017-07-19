//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapView.h>
#import <React/RCTComponent.h>
#import "RCT_BMKAnnotation.h"


/**
 * TODO: not all events are supported.
 */
@interface RCT_BMKMapView : BMKMapView {
@private
    NSMutableArray<NSString *> *_annotationIds;
}

#pragma mark event callbacks

// note that all event callback names should prefixed with 'on'
// eg. `didFinishLoading` should be renamed to `onDidFinishLoading`
@property(nonatomic, copy) RCTBubblingEventBlock onDidFinishLoading;
@property(nonatomic, copy) RCTBubblingEventBlock onDidFinishRendering;

// onDrawMapFrame:(BMKMapStatus*)status;
// regionWillChangeAnimated:(BOOL)animated;
@property(nonatomic, copy) RCTBubblingEventBlock onRegionWillChange;
// regionDidChangeAnimated:(BOOL)animated;
@property(nonatomic, copy) RCTBubblingEventBlock onRegionDidChange;
// didAddAnnotationViews:(NSArray *)views;
@property(nonatomic, copy) RCTBubblingEventBlock onDidAddAnnotationViews;
// didSelectAnnotationView:(BMKAnnotationView *)view;
@property(nonatomic, copy) RCTBubblingEventBlock onDidSelectAnnotationView;
// didDeselectAnnotationView:(BMKAnnotationView *)view;
@property(nonatomic, copy) RCTBubblingEventBlock onDidDeselectAnnotationView;
// annotationView:(BMKAnnotationView *)view didChangeDragState:(BMKAnnotationViewDragState)newState
// annotationViewForBubble:(BMKAnnotationView *)view;
// didAddOverlayViews:(NSArray *)overlayViews;
// onClickedBMKOverlayView:(BMKOverlayView *)overlayView;
// onClickedMapPoi:(BMKMapPoi*)mapPoi;
@property(nonatomic, copy) RCTBubblingEventBlock onClickedMapPoi;
// onClickedMapBlank:(CLLocationCoordinate2D)coordinate;
@property(nonatomic, copy) RCTBubblingEventBlock onClickedMapBlank;
// onDoubleClick:(CLLocationCoordinate2D)coordinate;
@property(nonatomic, copy) RCTBubblingEventBlock onDoubleClick;
// onLongClick:(CLLocationCoordinate2D)coordinate;
@property(nonatomic, copy) RCTBubblingEventBlock onLongClick;
// onForceTouch:(CLLocationCoordinate2D)coordinate force:(CGFloat)force maximumPossibleForce:(CGFloat)maximumPossibleForce;
// mapStatusDidChanged:(BMKMapView *)mapView;
@property(nonatomic, copy) RCTBubblingEventBlock onMapStatusDidChanged;
// baseIndoorMapWithIn:(BOOL)flag baseIndoorMapInfo:(BMKBaseIndoorMapInfo *)info;

#pragma mark AnnotationAPI

- (void)setAnnotations:(NSArray <RCT_BMKAnnotation *> *)annotations;

@end