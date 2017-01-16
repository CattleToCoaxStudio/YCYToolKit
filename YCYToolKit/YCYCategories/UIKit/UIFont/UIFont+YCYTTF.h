//
//  UIFont+YCYTTF.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (YCYTTF)

/**
 自定义字体文件

 @param path 路径
 @param size 大小
 @return 自定义字体
 */
+ (UIFont *)ycy_fontWithTTFAtPath:(NSString *)path size:(CGFloat)size;
/**
 自定义字体文件
 
 @param URL URL
 @param size 大小
 @return 自定义字体
 */
+ (UIFont *)ycy_fontWithTTFAtURL:(NSURL *)URL size:(CGFloat)size;
@end
