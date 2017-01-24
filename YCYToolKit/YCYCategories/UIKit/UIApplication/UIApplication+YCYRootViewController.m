//
//  UIApplication+YCYRootViewController.m
//  Pods
//
//  Created by yangchengyou on 17/1/24.
//
//

#import "UIApplication+YCYRootViewController.h"

@implementation UIApplication (YCYRootViewController)

+ (UIViewController *)ycy_currentRootViewController{
    UIViewController *rootVC = [[self sharedApplication] keyWindow].rootViewController;
    return rootVC;
}

@end
