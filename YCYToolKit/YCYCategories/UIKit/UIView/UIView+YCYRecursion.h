//
//  UIView+YCYRecursion.h
//
//  Created by Jakey on 15/6/23.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^YCYSubviewBlock) (UIView* view);
typedef void (^YCYSuperviewBlock) (UIView* superview);
@interface UIView (YCYRecursion)

/**
 *  @brief  寻找子视图
 *
 *  @param recurse 回调
 *
 *  @return  Return YES from the block to recurse into the subview.
 Set stop to YES to return the subview.
 */
- (UIView*)ycy_findViewRecursively:(BOOL(^)(UIView* subview, BOOL* stop))recurse;


/**
 递归子类

 @param block block
 */
-(void)ycy_runBlockOnAllSubviews:(YCYSubviewBlock)block;
/**
 递归父类
 
 @param block block
 */
-(void)ycy_runBlockOnAllSuperviews:(YCYSuperviewBlock)block;

/**
 所有subview都设置enable = yes
 */
-(void)ycy_enableAllControlsInViewHierarchy;
/**
 所有subview都设置enable = no
 */
-(void)ycy_disableAllControlsInViewHierarchy;
@end
