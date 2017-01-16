//
//  UIImage+YCYRemoteSize.h
//
//  Created by ycy on 15/1/27.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YCYUIImageSizeRequestCompleted) (NSURL* imgURL, CGSize size);

@interface UIImage (YCYRemoteSize)
/**
 *  @brief 获取远程图片的大小
 *
 *  @param imgURL     图片url
 *  @param completion 完成回调
 */
+ (void)ycy_requestSizeNoHeader:(NSURL*)imgURL completion:(YCYUIImageSizeRequestCompleted)completion;
/**
 *  @brief  从header中获取远程图片的大小 (服务器必须支持)
 *
 *  @param imgURL     图片url
 *  @param completion 完成回调
 */
//+ (void)requestSizeWithHeader:(NSURL*)imgURL completion:(UIImageSizeRequestCompleted)completion;

@end
