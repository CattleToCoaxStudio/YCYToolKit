//
//  UIBarButtonItem+Badge.h
//  therichest
//
//  Created by Mike on 2014-05-05.
//  Copyright (c) 2014 Valnet Inc. All rights reserved.
//  https://github.com/mikeMTOL/UIBarButtonItem-Badge

/*/ 使用方法
 UIImage *image = [UIImage imageNamed:@"someImage"];
 UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
 button.frame = CGRectMake(0,0,image.size.width, image.size.height);
 [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchDown];
 [button setBackgroundImage:image forState:UIControlStateNormal];
 
 // Make BarButton Item
 UIBarButtonItem *navLeftButton = [[UIBarButtonItem alloc] initWithCustomView:button];
 self.navigationItem.leftBarButtonItem = navLeftButton;
 self.navigationItem.leftBarButtonItem.ycy_badgeValue = @"1";
 */

#import <UIKit/UIKit.h>

@interface UIButton (YCYBadge)

@property (strong, nonatomic) UILabel *ycy_badge;

// Badge value to be display
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
