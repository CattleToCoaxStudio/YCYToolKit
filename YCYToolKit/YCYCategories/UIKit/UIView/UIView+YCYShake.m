//
//  UIView+YCYShake.m
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "UIView+YCYShake.h"

@implementation UIView (YCYShake)

- (void)ycy_shake {
    [self _ycy_shake:10 direction:1 currentTimes:0 withDelta:5 speed:0.03 shakeDirection:YCYShakeDirectionHorizontal completion:nil];
}

- (void)ycy_shake:(int)times withDelta:(CGFloat)delta {
    [self _ycy_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:YCYShakeDirectionHorizontal completion:nil];
}

- (void)ycy_shake:(int)times withDelta:(CGFloat)delta completion:(void(^)())handler {
    [self _ycy_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:YCYShakeDirectionHorizontal completion:handler];
}

- (void)ycy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self _ycy_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:YCYShakeDirectionHorizontal completion:nil];
}

- (void)ycy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void(^)())handler {
    [self _ycy_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:YCYShakeDirectionHorizontal completion:handler];
}

- (void)ycy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(YCYShakeDirection)shakeDirection {
    [self _ycy_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)ycy_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(YCYShakeDirection)shakeDirection completion:(void (^)(void))completion {
    [self _ycy_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:completion];
}

- (void)_ycy_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(YCYShakeDirection)shakeDirection completion:(void (^)(void))completionHandler {
    [UIView animateWithDuration:interval animations:^{
        self.layer.affineTransform = (shakeDirection == YCYShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _ycy_shake:(times - 1)
           direction:direction * -1
        currentTimes:current + 1
           withDelta:delta
               speed:interval
      shakeDirection:shakeDirection
          completion:completionHandler];
    }];
}

@end
