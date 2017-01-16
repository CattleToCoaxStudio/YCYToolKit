//
//  UIControl+YCYBlock.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIControl+YCYBlock.h"
#import <objc/runtime.h>
// UIControlEventTouchDown           = 1 <<  0,      // on all touch downs
// UIControlEventTouchDownRepeat     = 1 <<  1,      // on multiple touchdowns
// (tap count > 1)
// UIControlEventTouchDragInside     = 1 <<  2,
// UIControlEventTouchDragOutside    = 1 <<  3,
// UIControlEventTouchDragEnter      = 1 <<  4,
// UIControlEventTouchDragExit       = 1 <<  5,
// UIControlEventTouchUpInside       = 1 <<  6,
// UIControlEventTouchUpOutside      = 1 <<  7,
// UIControlEventTouchCancel         = 1 <<  8,
//
// UIControlEventValueChanged        = 1 << 12,     // sliders, etc.
//
// UIControlEventEditingDidBegin     = 1 << 16,     // UITextField
// UIControlEventEditingChanged      = 1 << 17,
// UIControlEventEditingDidEnd       = 1 << 18,
// UIControlEventEditingDidEndOnExit = 1 << 19,     // 'return key' ending
// editing
//
// UIControlEventAllTouchEvents      = 0x00000FFF,  // for touch events
// UIControlEventAllEditingEvents    = 0x000F0000,  // for UITextField
// UIControlEventApplicationReserved = 0x0F000000,  // range available for
// application use
// UIControlEventSystemReserved      = 0xF0000000,  // range reserved for
// internal framework use
// UIControlEventAllEvents           = 0xFFFFFFFF

#define YCY_UICONTROL_EVENT(methodName, eventName)                                \
-(void)methodName : (void (^)(void))eventBlock {                              \
objc_setAssociatedObject(self, @selector(methodName:), eventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);\
[self addTarget:self                                                        \
action:@selector(methodName##Action:)                                       \
forControlEvents:UIControlEvent##eventName];                                \
}                                                                               \
-(void)methodName##Action:(id)sender {                                        \
void (^block)() = objc_getAssociatedObject(self, @selector(methodName:));  \
if (block) {                                                                \
block();                                                                \
}                                                                           \
}

@implementation UIControl (YCYBlock)

YCY_UICONTROL_EVENT(ycy_touchDown, TouchDown)
YCY_UICONTROL_EVENT(ycy_touchDownRepeat, TouchDownRepeat)
YCY_UICONTROL_EVENT(ycy_touchDragInside, TouchDragInside)
YCY_UICONTROL_EVENT(ycy_touchDragOutside, TouchDragOutside)
YCY_UICONTROL_EVENT(ycy_touchDragEnter, TouchDragEnter)
YCY_UICONTROL_EVENT(ycy_touchDragExit, TouchDragExit)
YCY_UICONTROL_EVENT(ycy_touchUpInside, TouchUpInside)
YCY_UICONTROL_EVENT(ycy_touchUpOutside, TouchUpOutside)
YCY_UICONTROL_EVENT(ycy_touchCancel, TouchCancel)
YCY_UICONTROL_EVENT(ycy_valueChanged, ValueChanged)
YCY_UICONTROL_EVENT(ycy_editingDidBegin, EditingDidBegin)
YCY_UICONTROL_EVENT(ycy_editingChanged, EditingChanged)
YCY_UICONTROL_EVENT(ycy_editingDidEnd, EditingDidEnd)
YCY_UICONTROL_EVENT(ycy_editingDidEndOnExit, EditingDidEndOnExit)

@end
