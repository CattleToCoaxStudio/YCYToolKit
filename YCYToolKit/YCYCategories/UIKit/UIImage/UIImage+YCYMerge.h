//
//  UIImage+YCYMerge.h
//
//  Created by ycy on 14/12/30.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YCYMerge)
/**
 *  @brief  合并两个图片
 *
 *  @param firstImage  一个图片
 *  @param secondImage 二个图片
 *
 *  @return 合并后图片
 */
+ (UIImage*)ycy_mergeImage:(UIImage*)firstImage withImage:(UIImage*)secondImage;
@end
