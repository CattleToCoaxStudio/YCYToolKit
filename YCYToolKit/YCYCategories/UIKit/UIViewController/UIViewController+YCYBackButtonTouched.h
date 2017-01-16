//
//  UIViewController+YCYBackButtonTouched.h
//
//  Created by ycy on 14/12/30.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef void (^YCYBackButtonHandler)(UIViewController *vc);
@interface UIViewController (YCYBackButtonTouched)

/**
 返回按钮回调

 @param backButtonHandler 回调block
 */
-(void)ycy_backButtonTouched:(YCYBackButtonHandler)backButtonHandler;
@end
