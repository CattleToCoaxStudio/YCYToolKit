//
//  UIAlertView+YCYBlock.h
//
//  Created by ycy on 15/1/9.
//  Copyright (c) 2015年 NULLS All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewYCYCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (YCYBlock)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewYCYCallBackBlock ycy_alertViewCallBackBlock;

+ (void)ycy_alertWithCallBackBlock:(UIAlertViewYCYCallBackBlock)alertViewCallBackBlock
                            title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName
                otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
