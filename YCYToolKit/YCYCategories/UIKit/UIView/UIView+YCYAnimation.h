//
//  UIView+YCYAnimation.h
//  CoolUIViewAnimations
//
//  Created by Peter de Tagyos on 12/10/11.
//  Copyright (c) 2011 PT Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

float ycy_radiansForDegrees(int degrees);

@interface UIView (YCYAnimation)
//关于view的一些动画
// Moves
- (void)ycy_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
- (void)ycy_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
- (void)ycy_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)ycy_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

// Transforms
- (void)ycy_rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;
- (void)ycy_scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;
- (void)ycy_spinClockwise:(float)secs;
- (void)ycy_spinCounterClockwise:(float)secs;

// Transitions
- (void)ycy_curlDown:(float)secs;
- (void)ycy_curlUpAndAway:(float)secs;
- (void)ycy_drainAway:(float)secs;

// Effects
- (void)ycy_changeAlpha:(float)newAlpha secs:(float)secs;
- (void)ycy_pulse:(float)secs continuously:(BOOL)continuously;

//add subview
- (void)ycy_addSubviewWithFadeAnimation:(UIView *)subview;

@end
