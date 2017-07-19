//
// Created by johnzh on 17/7/18.
// Copyright (c) 2017 com.johnzh. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKAnnotation.h>
#import <UIKit/UIImage.h>

@interface RCT_BMKAnnotation : NSObject <BMKAnnotation>

@property(nonatomic, strong) UIImage *image;
@property(atomic) CGPoint centerOffset;
@property(atomic) NSString *identifier;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end