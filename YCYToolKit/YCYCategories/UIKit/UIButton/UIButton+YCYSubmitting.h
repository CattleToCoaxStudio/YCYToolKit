
//
//  UIButton+YCYSubmitting.h
//
//  Created by ycy on 15/4/2.
//  Copyright (c) 2015年 NULLS. All rights reserved.

#import <UIKit/UIKit.h>

@interface UIButton (YCYSubmitting)

/**
 *  @author foxsofter, 15-04-02 15:04:59
 *
 *  @brief  按钮点击后，禁用按钮并在按钮上显示ActivityIndicator，以及title
 *
 *  @param title 按钮上显示的文字
 */
- (void)ycy_beginSubmitting:(NSString *)title;

/**
 *  @author foxsofter, 15-04-02 15:04:13
 *
 *  @brief  按钮点击后，恢复按钮点击前的状态
 */
- (void)ycy_endSubmitting;

/**
 *  @author foxsofter, 15-04-02 15:04:17
 *
 *  @brief  按钮是否正在提交中
 */
@property(nonatomic, readonly, getter=isycySubmitting) NSNumber *ycy_submitting;

@end
