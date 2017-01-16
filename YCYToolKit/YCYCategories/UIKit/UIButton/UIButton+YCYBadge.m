//
//  UIBarButtonItem+Badge.m
//  therichest
//
//  Created by Mike on 2014-05-05.
//  Copyright (c) 2014 Valnet Inc. All rights reserved.
//
#import <objc/runtime.h>
#import "UIButton+YCYBadge.h"

NSString const *ycy_UIButton_badgeKey = @"ycy_UIButton_badgeKey";

NSString const *ycy_UIButton_badgeBGColorKey = @"ycy_UIButton_badgeBGColorKey";
NSString const *ycy_UIButton_badgeTextColorKey = @"ycy_UIButton_badgeTextColorKey";
NSString const *ycy_UIButton_badgeFontKey = @"ycy_UIButton_badgeFontKey";
NSString const *ycy_UIButton_badgePaddingKey = @"ycy_UIButton_badgePaddingKey";
NSString const *ycy_UIButton_badgeMinSizeKey = @"ycy_UIButton_badgeMinSizeKey";
NSString const *ycy_UIButton_badgeOriginXKey = @"ycy_UIButton_badgeOriginXKey";
NSString const *ycy_UIButton_badgeOriginYKey = @"ycy_UIButton_badgeOriginYKey";
NSString const *ycy_UIButton_shouldHideBadgeAtZeroKey = @"ycy_UIButton_shouldHideBadgeAtZeroKey";
NSString const *ycy_UIButton_shouldAnimateBadgeKey = @"ycy_UIButton_shouldAnimateBadgeKey";
NSString const *ycy_UIButton_badgeValueKey = @"ycy_UIButton_badgeValueKey";

@implementation UIButton (YCYBadge)

@dynamic ycy_badgeValue, ycy_badgeBGColor, ycy_badgeTextColor, ycy_badgeFont;
@dynamic ycy_badgePadding, ycy_badgeMinSize, ycy_badgeOriginX, ycy_badgeOriginY;
@dynamic ycy_shouldHideBadgeAtZero, ycy_shouldAnimateBadge;

- (void)ycy_badgeInit
{
    // Default design initialization
    self.ycy_badgeBGColor   = [UIColor redColor];
    self.ycy_badgeTextColor = [UIColor whiteColor];
    self.ycy_badgeFont      = [UIFont systemFontOfSize:12.0];
    self.ycy_badgePadding   = 6;
    self.ycy_badgeMinSize   = 8;
    self.ycy_badgeOriginX   = self.frame.size.width - self.ycy_badge.frame.size.width/2;
    self.ycy_badgeOriginY   = -4;
    self.ycy_shouldHideBadgeAtZero = YES;
    self.ycy_shouldAnimateBadge = YES;
    // Avoids badge to be clipped when animating its scale
    self.clipsToBounds = NO;
}

#pragma mark - Utility methods

// Handle badge display when its properties have been changed (color, font, ...)
- (void)ycy_refreshBadge
{
    // Change new attributes
    self.ycy_badge.textColor        = self.ycy_badgeTextColor;
    self.ycy_badge.backgroundColor  = self.ycy_badgeBGColor;
    self.ycy_badge.font             = self.ycy_badgeFont;
}

- (CGSize) ycy_badgeExpectedSize
{
    // When the value changes the badge could need to get bigger
    // Calculate expected size to fit new value
    // Use an intermediate label to get expected size thanks to sizeToFit
    // We don't call sizeToFit on the true label to avoid bad display
    UILabel *frameLabel = [self ycy_duplicateLabel:self.ycy_badge];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}

- (void)ycy_updateBadgeFrame
{

    CGSize expectedLabelSize = [self ycy_badgeExpectedSize];
    
    // Make sure that for small value, the badge will be big enough
    CGFloat minHeight = expectedLabelSize.height;
    
    // Using a const we make sure the badge respect the minimum size
    minHeight = (minHeight < self.ycy_badgeMinSize) ? self.ycy_badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.ycy_badgePadding;
    
    // Using const we make sure the badge doesn't get too smal
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    self.ycy_badge.frame = CGRectMake(self.ycy_badgeOriginX, self.ycy_badgeOriginY, minWidth + padding, minHeight + padding);
    self.ycy_badge.layer.cornerRadius = (minHeight + padding) / 2;
    self.ycy_badge.layer.masksToBounds = YES;
}

// Handle the badge changing value
- (void)ycy_updateBadgeValueAnimated:(BOOL)animated
{
    // Bounce animation on badge if value changed and if animation authorized
    if (animated && self.ycy_shouldAnimateBadge && ![self.ycy_badge.text isEqualToString:self.ycy_badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.ycy_badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    // Set the new value
    self.ycy_badge.text = self.ycy_badgeValue;
    
    // Animate the size modification if needed
    NSTimeInterval duration = animated ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self ycy_updateBadgeFrame];
    }];
}

- (UILabel *)ycy_duplicateLabel:(UILabel *)labelToCopy
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)ycy_removeBadge
{
    // Animate badge removal
    [UIView animateWithDuration:0.2 animations:^{
        self.ycy_badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.ycy_badge removeFromSuperview];
        self.ycy_badge = nil;
    }];
}

#pragma mark - getters/setters
-(UILabel*)ycy_badge {
    return objc_getAssociatedObject(self, &ycy_UIButton_badgeKey);
}
-(void)setYcy_badge:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &ycy_UIButton_badgeKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge value to be display
-(NSString *)ycy_badgeValue {
    return objc_getAssociatedObject(self, &ycy_UIButton_badgeValueKey);
}
-(void) setYcy_badgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &ycy_UIButton_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // When changing the badge value check if we need to remove the badge
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.ycy_shouldHideBadgeAtZero)) {
        [self ycy_removeBadge];
    } else if (!self.ycy_badge) {
        // Create a new badge because not existing
        self.ycy_badge                      = [[UILabel alloc] initWithFrame:CGRectMake(self.ycy_badgeOriginX, self.ycy_badgeOriginY, 20, 20)];
        self.ycy_badge.textColor            = self.ycy_badgeTextColor;
        self.ycy_badge.backgroundColor      = self.ycy_badgeBGColor;
        self.ycy_badge.font                 = self.ycy_badgeFont;
        self.ycy_badge.textAlignment        = NSTextAlignmentCenter;
        [self ycy_badgeInit];
        [self addSubview:self.ycy_badge];
        [self ycy_updateBadgeValueAnimated:NO];
    } else {
        [self ycy_updateBadgeValueAnimated:YES];
    }
}

// Badge background color
-(UIColor *)ycy_badgeBGColor {
    return objc_getAssociatedObject(self, &ycy_UIButton_badgeBGColorKey);
}
-(void)setYcy_badgeBGColor:(UIColor *)badgeBGColor
{
    objc_setAssociatedObject(self, &ycy_UIButton_badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ycy_badge) {
        [self ycy_refreshBadge];
    }
}

// Badge text color
-(UIColor *)ycy_badgeTextColor {
    return objc_getAssociatedObject(self, &ycy_UIButton_badgeTextColorKey);
}
-(void)setYcy_badgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &ycy_UIButton_badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ycy_badge) {
        [self ycy_refreshBadge];
    }
}

// Badge font
-(UIFont *)ycy_badgeFont {
    return objc_getAssociatedObject(self, &ycy_UIButton_badgeFontKey);
}
-(void)setYcy_badgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &ycy_UIButton_badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ycy_badge) {
        [self ycy_refreshBadge];
    }
}

// Padding value for the badge
-(CGFloat) ycy_badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &ycy_UIButton_badgePaddingKey);
    return number.floatValue;
}
-(void) setYcy_badgePadding:(CGFloat)badgePadding
{
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &ycy_UIButton_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ycy_badge) {
        [self ycy_updateBadgeFrame];
    }
}

// Minimum size badge to small
-(CGFloat) ycy_badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &ycy_UIButton_badgeMinSizeKey);
    return number.floatValue;
}
-(void) setYcy_badgeMinSize:(CGFloat)badgeMinSize
{
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &ycy_UIButton_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ycy_badge) {
        [self ycy_updateBadgeFrame];
    }
}

// Values for offseting the badge over the BarButtonItem you picked
-(CGFloat) ycy_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &ycy_UIButton_badgeOriginXKey);
    return number.floatValue;
}
-(void) setYcy_badgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &ycy_UIButton_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ycy_badge) {
        [self ycy_updateBadgeFrame];
    }
}

-(CGFloat) ycy_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &ycy_UIButton_badgeOriginYKey);
    return number.floatValue;
}
-(void) setYcy_badgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &ycy_UIButton_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ycy_badge) {
        [self ycy_updateBadgeFrame];
    }
}

// In case of numbers, remove the badge when reaching zero
-(BOOL) ycy_shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &ycy_UIButton_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setYcy_shouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero
{
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &ycy_UIButton_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge has a bounce animation when value changes
-(BOOL) ycy_shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &ycy_UIButton_shouldAnimateBadgeKey);
    return number.boolValue;
}
- (void)setYcy_shouldAnimateBadge:(BOOL)shouldAnimateBadge
{
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &ycy_UIButton_shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
