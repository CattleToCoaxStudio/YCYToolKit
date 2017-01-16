//
//  UIImageView+BetterFace.h
//  bf
//
//  Created by croath on 13-10-22.
//  Copyright (c) 2013年 Croath. All rights reserved.
//
// https://github.com/croath/UIImageView-BetterFace
//  a UIImageView category to let the picture-cutting with faces showing better

#import <UIKit/UIKit.h>

@interface UIImageView (YCYBetterFace)


/**
 是否需要调整到最佳
 */
@property (nonatomic) BOOL ycy_needsBetterFace;

/**
 识别速度---yes  识别精度低，但识别速度快、性能高  no 识别精度高，但识别速度慢、性能低
 */
@property (nonatomic) BOOL ycy_fast;

/**
 加入main.m  里面全局使用betterface
 */
void ycy_hack_uiimageview_bf();



/**
 根据人脸识别  来决定填充图片位置

 @param image 图片
 */
- (void)ycy_setBetterFaceImage:(UIImage *)image;

@end
