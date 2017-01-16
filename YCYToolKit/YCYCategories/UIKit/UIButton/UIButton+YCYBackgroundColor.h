//
//  UIButton+YCYBackgroundColor.h

//  Created by ycy on 15/5/9.
//  Copyright (c) 2015年 NULLS All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YCYBackgroundColor)
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)ycy_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
@end
