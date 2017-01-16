//
//  UIView+YCYConstraints.h
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YCYConstraints)
- (NSLayoutConstraint *)ycy_constraintForAttribute:(NSLayoutAttribute)attribute;

/**
 获取约束

 @return 约束
 */
- (NSLayoutConstraint *)ycy_leftConstraint;
- (NSLayoutConstraint *)ycy_rightConstraint;
- (NSLayoutConstraint *)ycy_topConstraint;
- (NSLayoutConstraint *)ycy_bottomConstraint;
- (NSLayoutConstraint *)ycy_leadingConstraint;
- (NSLayoutConstraint *)ycy_trailingConstraint;
- (NSLayoutConstraint *)ycy_widthConstraint;
- (NSLayoutConstraint *)ycy_heightConstraint;
- (NSLayoutConstraint *)ycy_centerXConstraint;
- (NSLayoutConstraint *)ycy_centerYConstraint;
- (NSLayoutConstraint *)ycy_baseLineConstraint;
@end
