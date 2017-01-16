//
//  UILabel+AutomaticWriting.h
//  UILabel-AutomaticWriting
//
//  Created by alexruperez on 10/3/15.
//  Copyright (c) 2015 alexruperez. All rights reserved.
//  https://github.com/alexruperez/UILabel-AutomaticWriting

#import <UIKit/UIKit.h>

//! Project version number for UILabel-AutomaticWriting.
FOUNDATION_EXPORT double UILabelAutomaticWritingVersionNumber;

//! Project version string for UILabel-AutomaticWriting.
FOUNDATION_EXPORT const unsigned char UILabelAutomaticWritingVersionString[];

extern NSTimeInterval const UILabelAWDefaultDuration;

extern unichar const UILabelAWDefaultCharacter;

typedef NS_ENUM(NSInteger, UILabelYCYlinkingMode)
{
    UILabelYCYlinkingModeNone,
    UILabelYCYlinkingModeUntilFinish,
    UILabelYCYlinkingModeUntilFinishKeeping,
    UILabelYCYlinkingModeWhenFinish,
    UILabelYCYlinkingModeWhenFinishShowing,
    UILabelYCYlinkingModeAlways
};

@interface UILabel (YCYAutomaticWriting)

@property (strong, nonatomic) NSOperationQueue *ycy_automaticWritingOperationQueue;
@property (assign, nonatomic) UIEdgeInsets ycy_edgeInsets;

/**
 给text添加写入动画

 @param text <#text description#>
 */
- (void)ycy_setTextWithAutomaticWritingAnimation:(NSString *)text;

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelYCYlinkingMode)blinkingMode;

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration;

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelYCYlinkingMode)blinkingMode;

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelYCYlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter;

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelYCYlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(void (^)(void))completion;

@end
