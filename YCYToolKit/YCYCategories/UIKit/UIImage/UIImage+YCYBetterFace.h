//
//  UIImage+YCYBetterFace.h
//  bf
//
//  Created by liuyan on 13-11-25.
//  Copyright (c) 2013年 Croath. All rights reserved.
//
// https://github.com/croath/UIImageView-BetterFace
//  a UIImageView category to let the picture-cutting with faces showing better

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YCYAccuracy) {
    YCYAccuracyLow = 0, //快速  低清晰
    YCYAccuracyHigh,// 效率低  速度快
};

@interface UIImage (YCYBetterFace)


/**
 返回一个调校好的图片

 @param size 尺寸
 @param accurary 清晰度
 @return 图片
 */
- (UIImage *)ycy_betterFaceImageForSize:(CGSize)size
                           accuracy:(YCYAccuracy)accurary;

@end
