//
//  UIScrollView+YCYAddition.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIScrollView+YCYAddition.h"

@implementation UIScrollView (YCYAddition)

//frame
- (CGFloat)ycy_contentWidth {
    return self.contentSize.width;
}
- (void)setYcy_contentWidth:(CGFloat)width {
    self.contentSize = CGSizeMake(width, self.frame.size.height);
}
- (CGFloat)ycy_contentHeight {
    return self.contentSize.height;
}
- (void)setYcy_contentHeight:(CGFloat)height {
    self.contentSize = CGSizeMake(self.frame.size.width, height);
}
- (CGFloat)ycy_contentOffsetX {
    return self.contentOffset.x;
}
- (void)setYcy_contentOffsetX:(CGFloat)x {
    self.contentOffset = CGPointMake(x, self.contentOffset.y);
}
- (CGFloat)ycy_contentOffsetY {
    return self.contentOffset.y;
}
- (void)setYcy_contentOffsetY:(CGFloat)y {
    self.contentOffset = CGPointMake(self.contentOffset.x, y);
}
//


- (CGPoint)ycy_topContentOffset
{
    return CGPointMake(0.0f, -self.contentInset.top);
}
- (CGPoint)ycy_bottomContentOffset
{
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}
- (CGPoint)ycy_leftContentOffset
{
    return CGPointMake(-self.contentInset.left, 0.0f);
}
- (CGPoint)ycy_rightContentOffset
{
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}
- (YCYScrollDirection)ycy_ScrollDirection
{
    YCYScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f)
    {
        direction = YCYScrollDirectionUp;
    }
    else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f)
    {
        direction = YCYScrollDirectionDown;
    }
    else if ([self.panGestureRecognizer translationInView:self].x < 0.0f)
    {
        direction = YCYScrollDirectionLeft;
    }
    else if ([self.panGestureRecognizer translationInView:self].x > 0.0f)
    {
        direction = YCYScrollDirectionRight;
    }
    else
    {
        direction = YCYScrollDirectionWTF;
    }
    
    return direction;
}
- (BOOL)ycy_isScrolledToTop
{
    return self.contentOffset.y <= [self ycy_topContentOffset].y;
}
- (BOOL)ycy_isScrolledToBottom
{
    return self.contentOffset.y >= [self ycy_bottomContentOffset].y;
}
- (BOOL)ycy_isScrolledToLeft
{
    return self.contentOffset.x <= [self ycy_leftContentOffset].x;
}
- (BOOL)ycy_isScrolledToRight
{
    return self.contentOffset.x >= [self ycy_rightContentOffset].x;
}
- (void)ycy_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:[self ycy_topContentOffset] animated:animated];
}
- (void)ycy_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:[self ycy_bottomContentOffset] animated:animated];
}
- (void)ycy_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:[self ycy_leftContentOffset] animated:animated];
}
- (void)ycy_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:[self ycy_rightContentOffset] animated:animated];
}
- (NSUInteger)ycy_verticalPageIndex
{
    return (self.contentOffset.y + (self.frame.size.height * 0.5f)) / self.frame.size.height;
}
- (NSUInteger)ycy_horizontalPageIndex
{
    return (self.contentOffset.x + (self.frame.size.width * 0.5f)) / self.frame.size.width;
}
- (void)ycy_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(0.0f, self.frame.size.height * pageIndex) animated:animated];
}
- (void)ycy_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.frame.size.width * pageIndex, 0.0f) animated:animated];
}


@end
