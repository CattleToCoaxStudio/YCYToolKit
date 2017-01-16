//
//  UIImage+YCYBlur.h
//
//  Created by ycy on 15/6/5.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXPORT double ImageEffectsVersionNumber;
FOUNDATION_EXPORT const unsigned char ImageEffectsVersionString[];
@interface UIImage (YCYBlur)

/**
 设置亮色

 @return 图片
 */
- (UIImage *)ycy_lightImage;
/**
 设置亮色
 
 @return 图片
 */
- (UIImage *)ycy_extraLightImage;
/**
 设置灰度图
 
 @return 图片
 */
- (UIImage *)ycy_darkImage;
/**
 设置颜色图片
 
 @return 图片
 */
- (UIImage *)ycy_tintedImageWithColor:(UIColor *)tintColor;

- (UIImage *)ycy_blurredImageWithRadius:(CGFloat)blurRadius;
- (UIImage *)ycy_blurredImageWithSize:(CGSize)blurSize;
- (UIImage *)ycy_blurredImageWithSize:(CGSize)blurSize
                        tintColor:(UIColor *)tintColor
            saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                        maskImage:(UIImage *)maskImage;
@end
