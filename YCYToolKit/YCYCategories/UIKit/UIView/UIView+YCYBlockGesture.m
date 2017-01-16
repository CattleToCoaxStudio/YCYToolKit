//
//  UIView+YCYBlockGesture.h
//
//  Created by ycy on 14/12/30.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import "UIView+YCYBlockGesture.h"
#import <objc/runtime.h>
static char ycy_kActionHandlerTapBlockKey;
static char ycy_kActionHandlerTapGestureKey;
static char ycy_kActionHandlerLongPressBlockKey;
static char ycy_kActionHandlerLongPressGestureKey;

@implementation UIView (YCYBlockGesture)
- (void)ycy_addTapActionWithBlock:(YCYGestureActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &ycy_kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ycy_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &ycy_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &ycy_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)ycy_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        YCYGestureActionBlock block = objc_getAssociatedObject(self, &ycy_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
- (void)ycy_addLongPressActionWithBlock:(YCYGestureActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &ycy_kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(ycy_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &ycy_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &ycy_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)ycy_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        YCYGestureActionBlock block = objc_getAssociatedObject(self, &ycy_kActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}
@end
