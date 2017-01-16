//
//  UIWebView+YCYStyle.m
//
//  Created by jakey on 14-3-11.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIWebView+YCYStyle.h"

@implementation UIWebView (YCYStyle)
/**
 *  @brief  是否显示阴影
 *
 *  @param hidden 是否显示阴影
 */
- (void)ycy_shadowViewHidden:(BOOL)hidden{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsHorizontalScrollIndicator:NO];
            for (UIView *shadowView in aView.subviews)
            {
                if ([shadowView isKindOfClass:[UIImageView class]])
                {
                    shadowView.hidden = hidden;  //上下滚动出边界时的黑色的图片 也就是拖拽后的上下阴影
                }
            }
        }
    }
}
/**
 *  @brief  是否显示水平滑动指示器
 *
 *  @param hidden 是否显示水平滑动指示器
 */
- (void)ycy_showsHorizontalScrollIndicator:(BOOL)hidden{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsHorizontalScrollIndicator:hidden];
        }
    }
}
/**
 *  @brief  是否显示垂直滑动指示器
 *
 *  @param hidden 是否显示垂直滑动指示器
 */
- (void)ycy_showsVerticalScrollIndicator:(BOOL)hidden{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsVerticalScrollIndicator:hidden];
        }
    }
}
/**
 *  @brief  网页透明
 */
-(void)ycy_makeTransparent
{
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
}
/**
 *  @brief  网页透明移除阴影
 */
-(void)ycy_makeTransparentAndRemoveShadow
{
    [self ycy_makeTransparent];
    [self ycy_shadowViewHidden:YES];
}
@end
