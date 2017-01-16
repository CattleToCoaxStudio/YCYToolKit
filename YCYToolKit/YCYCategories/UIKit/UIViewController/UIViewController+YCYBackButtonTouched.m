//
//  UIViewController+YCYBackButtonTouched.h
//
//  Created by ycy on 14/12/30.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//
#import "UIViewController+YCYBackButtonTouched.h"
#import <objc/runtime.h>
static const void *YCYBackButtonHandlerKey = &YCYBackButtonHandlerKey;

@implementation UIViewController (YCYBackButtonTouched)
-(void)ycy_backButtonTouched:(YCYBackButtonHandler)backButtonHandler{
    objc_setAssociatedObject(self, YCYBackButtonHandlerKey, backButtonHandler, OBJC_ASSOCIATION_COPY);
}
- (YCYBackButtonHandler)ycy_backButtonTouched
{
    return objc_getAssociatedObject(self, YCYBackButtonHandlerKey);
}
@end

@implementation UINavigationController (ShouldPopItem)
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {

	if([self.viewControllers count] < [navigationBar.items count]) {
		return YES;
	}

   	UIViewController* vc = [self topViewController];
    YCYBackButtonHandler handler = [vc ycy_backButtonTouched];
    if (handler) {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906

        for(UIView *subview in [navigationBar subviews]) {
            if(subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(self);
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }

	return NO;
}
@end
