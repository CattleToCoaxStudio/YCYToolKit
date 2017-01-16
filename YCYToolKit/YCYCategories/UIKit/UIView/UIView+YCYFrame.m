//
//  UIView+YCYFrame.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import "UIView+YCYFrame.h"

@implementation UIView (YCYFrame)
#pragma mark - Shortcuts for the coords

- (CGFloat)ycy_top
{
    return self.frame.origin.y;
}

- (void)setYcy_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)ycy_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYcy_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)ycy_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYcy_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)ycy_left
{
    return self.frame.origin.x;
}

- (void)setYcy_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)ycy_width
{
    return self.frame.size.width;
}

- (void)setYcy_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)ycy_height
{
    return self.frame.size.height;
}

- (void)setYcy_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)ycy_origin {
    return self.frame.origin;
}

- (void)setYcy_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)ycy_size {
    return self.frame.size;
}

- (void)setYcy_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)ycy_centerX {
    return self.center.x;
}

- (void)setYcy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)ycy_centerY {
    return self.center.y;
}

- (void)setYcy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

@end
