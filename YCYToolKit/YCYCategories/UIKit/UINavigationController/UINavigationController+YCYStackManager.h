//
//  UINavigationController+YCYStackManager.h
//
//  Created by ycy on 15/4/25.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (YCYStackManager)
/**
 *  @brief  寻找Navigation中的某个viewcontroler对象
 *
 *  @param className viewcontroler名称
 *
 *  @return viewcontroler对象
 */
- (id)ycy_findViewController:(NSString*)className;
/**
 *  @brief  判断是否只有一个RootViewController
 *
 *  @return 是否只有一个RootViewController
 */
- (BOOL)ycy_isOnlyContainRootViewController;
/**
 *  @brief  RootViewController  这个拿到的始终是第一次设置成rootvc的controller
 *
 *  @return RootViewController
 */
- (UIViewController *)ycy_rootViewController;
/**
 *  @brief  返回指定的viewcontroler
 *
 *  @param className 指定viewcontroler类名
 *  @param animated  是否动画
 *
 *  @return pop之后的viewcontrolers
 */
- (NSArray *)ycy_popToViewControllerWithClassName:(NSString*)className animated:(BOOL)animated;
/**
 *  @brief  pop n层
 *
 *  @param level  n层
 *  @param animated  是否动画
 *
 *  @return pop之后的viewcontrolers
 */
- (NSArray *)ycy_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;
@end
