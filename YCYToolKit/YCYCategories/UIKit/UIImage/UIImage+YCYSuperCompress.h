//
//  UIImage+YCYSuperCompress.h
//
//  Created by Jakey on 16/1/22.
//  Copyright © 2016年 Jakey. All rights reserved.

//usage      [UIImage compressImage:image toMaxLength:512*1024*8 maxWidth:1024];

#import <UIKit/UIKit.h>

@interface UIImage (YCYSuperCompress)
/**
 *  压缩上传图片到指定字节
 *
 *  @param image     压缩的图片
 *  @param maxLength 压缩后最大字节大小
 *
 *  @return 压缩后图片的二进制
 */
+ (NSData *)ycy_compressImage:(UIImage *)image toMaxLength:(NSInteger) maxLength maxWidth:(NSInteger)maxWidth;

/**
 *  获得指定size的图片
 *
 *  @param image   原始图片
 *  @param newSize 指定的size
 *
 *  @return 调整后的图片
 */
+ (UIImage *)ycy_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize;

/**
 *  通过指定图片最长边，获得等比例的图片size
 *
 *  @param image       原始图片
 *  @param imageLength 图片允许的最长宽度（高度）
 *
 *  @return 获得等比例的size
 */
+ (CGSize)ycy_scaleImage:(UIImage *) image withLength:(CGFloat) imageLength;


+ (UIImage*)ycy_resizableHalfImage:(NSString *)name;
@end
