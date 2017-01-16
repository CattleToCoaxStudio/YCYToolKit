//
//  UIViewController+YCYVisible.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import "UIViewController+YCYVisible.h"

@implementation UIViewController (YCYVisible)
- (BOOL)ycy_isVisible {
    return [self isViewLoaded] && self.view.window;
}
@end
