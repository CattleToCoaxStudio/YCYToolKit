//
//  UILabel+YCYSuggestSize.h
//  WordPress
//
//  Created by Eric J on 6/18/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YCYSuggestSize)

/**
 设置显示范围

 @param width 宽
 @return 不限高的自适应范围
 */
- (CGSize)ycy_suggestedSizeForWidth:(CGFloat)width;

/**
 设置显示范围

 @param string NSAttributedString
 @param width 宽
 @return 不限高的自适应范围
 */
- (CGSize)ycy_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;

/**
 设置显示范围

 @param string string
 @param width 宽
 @return 不限高的自适应范围
 */
- (CGSize)ycy_suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end
