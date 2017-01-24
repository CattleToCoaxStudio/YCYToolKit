//
//  UIApplication+YCYRootViewController.h
//  Pods
//
//  Created by yangchengyou on 17/1/24.
//
//

#import <UIKit/UIKit.h>

@interface UIApplication (YCYRootViewController)

/**
 返回当前rootvc
 
 @return viewcontroller
 */
+ (UIViewController *)ycy_currentRootViewController;

@end
