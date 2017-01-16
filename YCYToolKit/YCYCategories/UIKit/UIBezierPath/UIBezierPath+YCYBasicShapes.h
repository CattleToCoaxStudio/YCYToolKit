//
//  UIBezierPath+YCYBasicShapes.h
//  Example
//
//  Created by Pierre Dulac on 26/02/13.
//  Copyright (c) 2013 Pierre Dulac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (YCYBasicShapes)

+ (UIBezierPath *)ycy_heartShape:(CGRect)originalFrame;
+ (UIBezierPath *)ycy_userShape:(CGRect)originalFrame;
+ (UIBezierPath *)ycy_martiniShape:(CGRect)originalFrame;
+ (UIBezierPath *)ycy_beakerShape:(CGRect)originalFrame;
+ (UIBezierPath *)ycy_starShape:(CGRect)originalFrame;
+ (UIBezierPath *)ycy_stars:(NSUInteger)numberOfStars shapeInFrame:(CGRect)originalFrame;

@end
