//
//  UIColor+YCYModify.h
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YCYModify)


/**
 反向的颜色

 @return 反向参数颜色
 */
- (UIColor *)ycy_invertedColor;


/**
 半透明

 @return 半透明
 */
- (UIColor *)ycy_colorForTranslucency;


/**
 亮色

 @param lighten  增加的亮度
 @return 亮色
 */
- (UIColor *)ycy_lightenColor:(CGFloat)lighten;


/**
 模糊变暗
 @param darken 减少的值
 @return 模糊色
 */
- (UIColor *)ycy_darkenColor:(CGFloat)darken;

@end
