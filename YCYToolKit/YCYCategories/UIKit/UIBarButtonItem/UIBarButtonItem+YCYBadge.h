//
//  UIBarButtonItem+Badge.h
//  therichest
//
//  Created by Mike on 2014-05-05.
//  Copyright (c) 2014 Valnet Inc. All rights reserved.
//  https://github.com/mikeMTOL/UIBarButtonItem-Badge

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YCYBadge)

@property (strong, atomic) UILabel *ycy_badge;

// Badge value to be display

/**
 使用时直接设置value
 */
@property (nonatomic) NSString *ycy_badgeValue;
// Badge background color
@property (nonatomic) UIColor *ycy_badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *ycy_badgeTextColor;
// Badge font
@property (nonatomic) UIFont *ycy_badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat ycy_badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat ycy_badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat ycy_badgeOriginX;
@property (nonatomic) CGFloat ycy_badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL ycy_shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL ycy_shouldAnimateBadge;

@end
