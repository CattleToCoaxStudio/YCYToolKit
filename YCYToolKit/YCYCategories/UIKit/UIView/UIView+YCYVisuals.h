//
//  UIView+YCYVisuals.h
//
//  Created by Heiko Dreyer on 25.05.11.
//  Copyright 2011 boxedfolder.com. All rights reserved.

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface UIView (YCYVisuals)


/**
 设置圆角

 @param radius 圆角大小
 @param size 宽度大小
 @param color 颜色
 */
-(void)ycy_cornerRadius: (CGFloat)radius
         strokeSize: (CGFloat)size 
              color: (UIColor *)color;
/*
 *  Sets a corners
 */
-(void)ycy_setRoundedCorners:(UIRectCorner)corners
                  radius:(CGFloat)radius;

/*
 *  Draws shadow with properties
 */
-(void)ycy_shadowWithColor: (UIColor *)color
                offset: (CGSize)offset 
               opacity: (CGFloat)opacity 
                radius: (CGFloat)radius;

/*
 *  Removes from superview with fade
 */
-(void)ycy_removeFromSuperviewWithFadeDuration: (NSTimeInterval)duration;

/*
 *  Adds a subview with given transition & duration
 */
-(void)ycy_addSubview: (UIView *)view withTransition: (UIViewAnimationTransition)transition duration: (NSTimeInterval)duration;

/*
 *  Removes view from superview with given transition & duration
 */
-(void)ycy_removeFromSuperviewWithTransition: (UIViewAnimationTransition)transition duration: (NSTimeInterval)duration;


/**
 给定角度旋转

 @param angle 角度
 @param duration 时间
 @param autoreverse autoreverse
 @param repeatCount 重复次数
 @param timingFunction CAMediaTimingFunction
 */
-(void)ycy_rotateByAngle: (CGFloat)angle
            duration: (NSTimeInterval)duration 
         autoreverse: (BOOL)autoreverse
         repeatCount: (CGFloat)repeatCount
      timingFunction: (CAMediaTimingFunction *)timingFunction;

/*
 *  Moves view to point. TimingFunction can be nil and defaults to kCAMediaTimingFunctionEaseInEaseOut.
 */
-(void)ycy_moveToPoint: (CGPoint)newPoint 
          duration: (NSTimeInterval)duration 
       autoreverse: (BOOL)autoreverse
       repeatCount: (CGFloat)repeatCount
    timingFunction: (CAMediaTimingFunction *)timingFunction;

@end
