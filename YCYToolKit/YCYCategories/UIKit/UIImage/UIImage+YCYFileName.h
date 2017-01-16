//
//  UIImage+YCYFileName.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YCYFileName)
/**
 *  @brief  根据main bundle中的文件名读取图片
 *
 *  @param name 图片名
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)ycy_imageWithFileName:(NSString *)name;
/**
 *  @author ycyCategories
 *
 *  根据指定bundle中的文件名读取图片
 *
 *  @param name   图片名
 *  @param bundle bundle
 *
 *  @return 无缓存的图片
 */
+ (UIImage *)ycy_imageWithFileName:(NSString *)name inBundle:(NSBundle*)bundle;
@end
