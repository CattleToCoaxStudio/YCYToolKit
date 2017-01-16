//
//  UIScrollView+YCYPages.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YCYPages)

- (NSInteger)ycy_pages;
- (NSInteger)ycy_currentPage;
- (CGFloat)ycy_scrollPercent;

- (CGFloat)ycy_pagesY;
- (CGFloat)ycy_pagesX;
- (CGFloat)ycy_currentPageY;
- (CGFloat)ycy_currentPageX;
- (void)ycy_setPageY:(CGFloat)page;
- (void)ycy_setPageX:(CGFloat)page;
- (void)ycy_setPageY:(CGFloat)page animated:(BOOL)animated;
- (void)ycy_setPageX:(CGFloat)page animated:(BOOL)animated;

@end
