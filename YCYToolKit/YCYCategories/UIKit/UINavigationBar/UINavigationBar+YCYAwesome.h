//
//  UINavigationBar+Awesome.h
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//  https://github.com/ltebean/LTNavigationBar

#import <UIKit/UIKit.h>

@interface UINavigationBar (YCYAwesome)

/**
 导航栏设置背景色

 @param backgroundColor color
 */
- (void)ycy_setBackgroundColor:(UIColor *)backgroundColor;

/**
 給各元素设置透明度

 @param alpha alpha
 */
- (void)ycy_setElementsAlpha:(CGFloat)alpha;

/**
 偏移量

 @param translationY y
 */
- (void)ycy_setTranslationY:(CGFloat)translationY;

/**
 恢复默认
 */
- (void)ycy_reset;
@end
