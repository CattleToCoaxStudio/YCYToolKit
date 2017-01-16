//
//  UIViewController+YCYBackButtonItemTitle.m
//
//  Created by ycy on 15/8/6.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import "UIViewController+YCYBackButtonItemTitle.h"

@implementation UIViewController (YCYBackButtonItemTitle)

@end

@implementation UINavigationController (YCYNavigationItemBackBtnTile)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    
    UIViewController * viewController = self.viewControllers.count > 1 ? \
                    [self.viewControllers objectAtIndex:self.viewControllers.count - 2] : nil;
    
    if (!viewController) {
        return YES;
    }
    
    NSString *backButtonTitle = nil;
    if ([viewController respondsToSelector:@selector(ycy_navigationItemBackBarButtonTitle)]) {
        backButtonTitle = [viewController ycy_navigationItemBackBarButtonTitle];
    }
    
    if (!backButtonTitle) {
        backButtonTitle = viewController.title;
    }
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:backButtonTitle
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil action:nil];
    viewController.navigationItem.backBarButtonItem = backButtonItem;
    
    return YES;
}

@end
