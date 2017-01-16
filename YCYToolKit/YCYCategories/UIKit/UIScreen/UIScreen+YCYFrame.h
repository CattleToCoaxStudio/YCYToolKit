//
//  UIScreen+YCYFrame.h
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (YCYFrame)

/**
 返回屏幕size

 @return size
 */
+ (CGSize)ycy_size;
+ (CGFloat)ycy_width;
+ (CGFloat)ycy_height;

/**
 根据方向 返回

 @return size
 */
+ (CGSize)ycy_orientationSize;
+ (CGFloat)ycy_orientationWidth;
+ (CGFloat)ycy_orientationHeight;
+ (CGSize)ycy_DPISize;

@end
