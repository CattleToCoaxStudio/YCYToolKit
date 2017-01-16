//
//  UIImage+YCYCapture.h
//
//  Created by ycy on 15/1/10.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YCYCapture)
/**
 *  @brief  截图指定view成图片
 *
 *  @param view 一个view
 *
 *  @return 图片
 */
+ (UIImage *)ycy_captureWithView:(UIView *)view;

+ (UIImage *)ycy_getImageWithSize:(CGRect)myImageRect FromImage:(UIImage *)bigImage;

/**
 *  @author Jakey
 *
 *  @brief  截图一个view中所有视图 包括旋转缩放效果
 *
 *  @param aView    指定的view
 *  @param maxWidth 宽的大小 0为view默认大小
 *
 *  @return 截图
 */
+ (UIImage *)ycy_screenshotWithView:(UIView *)aView limitWidth:(CGFloat)maxWidth;
@end
