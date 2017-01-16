//
//  UIView+YCYBlockGesture.h
//
//  Created by ycy on 14/12/30.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^YCYGestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (YCYBlockGesture)
/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)ycy_addTapActionWithBlock:(YCYGestureActionBlock)block;
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)ycy_addLongPressActionWithBlock:(YCYGestureActionBlock)block;
@end
