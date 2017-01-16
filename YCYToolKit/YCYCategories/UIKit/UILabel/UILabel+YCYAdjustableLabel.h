//
//  UILabel+YCYESAdjustableLabel.h
//  ===========================
//  This category adds a few helper methods to adjust
//  a UIlabel to fit its text. 
//  
//  You can specify the minimum and maximum label size,
//  minimum font size, or none at all.
//                      ----
//
//  Created by Edgar Schmidt (@edgarschmidt) on 4/14/12.
//  Copyright (c) 2012 Edgar Schmidt. All rights reserved.
//
//  This code is provided without any warranties.
//  Hack around and enjoy ;)
//

#import <UIKit/UIKit.h>

@interface UILabel (YCYAdjustableLabel)

// General method. If minSize is set to CGSizeZero then
// it is ignored
// =====================================================

/**
 设置显示范围

 @param maxSize 最大范围
 @param minSize 最下范围
 @param minFontSize fontsize 没用到不用传
 */
- (void)ycy_adjustLabelToMaximumSize:(CGSize)maxSize
                     minimumSize:(CGSize)minSize 
                 minimumFontSize:(int)minFontSize;

// Adjust label using only the maximum size and the 
// font size as constraints
// =====================================================

/**
 显示范围

 @param maxSize 最大范围
 @param minFontSize fontsize
 */
- (void)ycy_adjustLabelToMaximumSize:(CGSize)maxSize
                 minimumFontSize:(int)minFontSize;

// Adjust the size of the label using only the font
// size as a constraint (the maximum size will be
// calculated automatically based on the screen size)
// =====================================================

/**
 默认范围  屏幕宽 间距20 不限高

 @param minFontSize 无用
 */
- (void)ycy_adjustLabelSizeWithMinimumFontSize:(int)minFontSize;

// Adjust label without any constraints (the maximum 
// size will be calculated automatically based on the
// screen size)
// =====================================================

/**
 默认 屏幕宽  边距 20
 */
- (void)ycy_adjustLabel;

@end
