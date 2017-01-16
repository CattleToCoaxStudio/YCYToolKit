//
//  UIView+YCYFrame.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YCYFrame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint ycy_origin;
@property (nonatomic, assign) CGSize ycy_size;

// shortcuts for positions
@property (nonatomic) CGFloat ycy_centerX;
@property (nonatomic) CGFloat ycy_centerY;


@property (nonatomic) CGFloat ycy_top;
@property (nonatomic) CGFloat ycy_bottom;
@property (nonatomic) CGFloat ycy_right;
@property (nonatomic) CGFloat ycy_left;

@property (nonatomic) CGFloat ycy_width;
@property (nonatomic) CGFloat ycy_height;
@end
