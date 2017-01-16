//
//  UIView+YCYCustomBorder.h
//
//  Created by luomeng on 15/11/3.
//  Copyright © 2015年 luomeng. All rights reserved.
//
/**
 * 视图添加边框
 */

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, YCYExcludePoint) {
    YCYExcludeStartPoint = 1 << 0,
    YCYExcludeEndPoint = 1 << 1,
    YCYExcludeAllPoint = ~0UL
};


@interface UIView (YCYCustomBorder)

/**
 添加边框

 @param color 颜色
 @param borderWidth 边宽大小
 */
- (void)ycy_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)ycy_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth;
- (void)ycy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
- (void)ycy_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;

- (void)ycy_removeTopBorder;
- (void)ycy_removeLeftBorder;
- (void)ycy_removeBottomBorder;
- (void)ycy_removeRightBorder;


- (void)ycy_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(YCYExcludePoint)edge;
- (void)ycy_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(YCYExcludePoint)edge;
- (void)ycy_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(YCYExcludePoint)edge;
- (void)ycy_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(YCYExcludePoint)edge;
@end
