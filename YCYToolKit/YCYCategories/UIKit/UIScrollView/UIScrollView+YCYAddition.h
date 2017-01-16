//
//  UIScrollView+YCYAddition.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YCYScrollDirection) {
    YCYScrollDirectionUp,
    YCYScrollDirectionDown,
    YCYScrollDirectionLeft,
    YCYScrollDirectionRight,
    YCYScrollDirectionWTF
};

@interface UIScrollView (YCYAddition)
@property(nonatomic) CGFloat ycy_contentWidth;
@property(nonatomic) CGFloat ycy_contentHeight;
@property(nonatomic) CGFloat ycy_contentOffsetX;
@property(nonatomic) CGFloat ycy_contentOffsetY;

- (CGPoint)ycy_topContentOffset;
- (CGPoint)ycy_bottomContentOffset;
- (CGPoint)ycy_leftContentOffset;
- (CGPoint)ycy_rightContentOffset;

- (YCYScrollDirection)ycy_ScrollDirection;

- (BOOL)ycy_isScrolledToTop;
- (BOOL)ycy_isScrolledToBottom;
- (BOOL)ycy_isScrolledToLeft;
- (BOOL)ycy_isScrolledToRight;

/**
 滚动

 @param animated animate
 */
- (void)ycy_scrollToTopAnimated:(BOOL)animated;
- (void)ycy_scrollToBottomAnimated:(BOOL)animated;
- (void)ycy_scrollToLeftAnimated:(BOOL)animated;
- (void)ycy_scrollToRightAnimated:(BOOL)animated;

- (NSUInteger)ycy_verticalPageIndex;
- (NSUInteger)ycy_horizontalPageIndex;

/**
 设置水平偏移

 @param pageIndex page
 @param animated animate
 */
- (void)ycy_scrollToVerticalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
- (void)ycy_scrollToHorizontalPageIndex:(NSUInteger)pageIndex animated:(BOOL)animated;
@end
