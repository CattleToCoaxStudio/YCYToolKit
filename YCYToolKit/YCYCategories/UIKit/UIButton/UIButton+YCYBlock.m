//
//  UIButton+Block.h

//  Created by ycy on 14/12/30.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import "UIButton+YCYBlock.h"
#import <objc/runtime.h>
static const void *ycy_UIButtonBlockKey = &ycy_UIButtonBlockKey;

@implementation UIButton (YCYBlock)
-(void)ycy_addActionHandler:(YCYTouchedButtonBlock)touchHandler{
    objc_setAssociatedObject(self, ycy_UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(ycy_blockActionTouched:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)ycy_blockActionTouched:(UIButton *)btn{
    YCYTouchedButtonBlock block = objc_getAssociatedObject(self, ycy_UIButtonBlockKey);
    if (block) {
        block(btn.tag);
    }
}
@end

