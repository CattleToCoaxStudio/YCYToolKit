//
//  UIView+YCYScreenshot.h
//
//  Created by Jakey on 15/1/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YCYScreenshot)
/**
 *  @brief  view截图
 *
 *  @return 截图
 */
- (UIImage *)ycy_screenshot;

/**
 view截图

 @param maxWidth 最大宽度
 @return 截图
 */
- (UIImage *)ycy_screenshot:(CGFloat)maxWidth;
@end
