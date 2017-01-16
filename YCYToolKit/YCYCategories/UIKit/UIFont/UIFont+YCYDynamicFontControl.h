//
//  UIFont+YCYDynamicFontControl.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//
//可参考博客http://www.cnblogs.com/dsxniubility/p/4699352.html

#import <UIKit/UIKit.h>

@interface UIFont (YCYDynamicFontControl)

/**
 设置动态字体  配合自适应使用

 @param style 样式
 @param fontName fontname
 @param scale scale
 @return 动态字体
 */
+(UIFont *)ycy_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale;

/**
 设置动态字体  配合自适应使用
 
 @param style 样式 UIFontTextStyleHeadline
 @param fontName fontname
 @return 动态字体
 */
+(UIFont *)ycy_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName;


/**
 设置动态字体  配合自适应使用
 
 @param style 样式   UIFontTextStyleHeadline
 @return 动态字体
 */
-(UIFont *)ycy_adjustFontForTextStyle:(NSString *)style;

/**
 设置动态字体  配合自适应使用
 
 @param style 样式 UIFontTextStyleHeadline
 @param scale scale 1.0
 @return 动态字体
 */
-(UIFont *)ycy_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale;

@end
