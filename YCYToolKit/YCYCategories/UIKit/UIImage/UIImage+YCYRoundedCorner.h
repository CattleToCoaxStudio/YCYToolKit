// UIImage+YCYRoundedCorner.h
// Created by Trevor Harmon on 9/20/09.
// Free for personal or commercial use, with or without modification.
// No warranty is expressed or implied.

// Extends the UIImage class to support making rounded corners
#import <UIKit/UIKit.h>
@interface UIImage (YCYRoundedCorner)

/**
 添加圆角

 @param cornerSize 圆角大小
 @param borderSize 边框大小
 @return 裁剪后的图片
 */
- (UIImage *)ycy_roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;
@end
