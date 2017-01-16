//  UITextField+YCYBlocks.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//
#import "UITextField+YCYBlocks.h"
#import <objc/runtime.h>
typedef BOOL (^YCYUITextFieldReturnBlock) (UITextField *textField);
typedef void (^YCYUITextFieldVoidBlock) (UITextField *textField);
typedef BOOL (^YCYUITextFieldCharacterChangeBlock) (UITextField *textField, NSRange range, NSString *replacementString);
@implementation UITextField (YCYBlocks)
static const void *YCYUITextFieldDelegateKey = &YCYUITextFieldDelegateKey;
static const void *YCYUITextFieldShouldBeginEditingKey = &YCYUITextFieldShouldBeginEditingKey;
static const void *YCYUITextFieldShouldEndEditingKey = &YCYUITextFieldShouldEndEditingKey;
static const void *YCYUITextFieldDidBeginEditingKey = &YCYUITextFieldDidBeginEditingKey;
static const void *YCYUITextFieldDidEndEditingKey = &YCYUITextFieldDidEndEditingKey;
static const void *YCYUITextFieldShouldChangeCharactersInRangeKey = &YCYUITextFieldShouldChangeCharactersInRangeKey;
static const void *YCYUITextFieldShouldClearKey = &YCYUITextFieldShouldClearKey;
static const void *YCYUITextFieldShouldReturnKey = &YCYUITextFieldShouldReturnKey;
#pragma mark UITextField Delegate methods
+ (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    YCYUITextFieldReturnBlock block = textField.ycy_shouldBegindEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, YCYUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    YCYUITextFieldReturnBlock block = textField.ycy_shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, YCYUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (void)textFieldDidBeginEditing:(UITextField *)textField
{
   YCYUITextFieldVoidBlock block = textField.ycy_didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, YCYUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (void)textFieldDidEndEditing:(UITextField *)textField
{
    YCYUITextFieldVoidBlock block = textField.ycy_didEndEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, YCYUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    YCYUITextFieldCharacterChangeBlock block = textField.ycy_shouldChangeCharactersInRangeBlock;
    if (block) {
        return block(textField,range,string);
    }
    id delegate = objc_getAssociatedObject(self, YCYUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
+ (BOOL)textFieldShouldClear:(UITextField *)textField
{
    YCYUITextFieldReturnBlock block = textField.ycy_shouldClearBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, YCYUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
}
+ (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    YCYUITextFieldReturnBlock block = textField.ycy_shouldReturnBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, YCYUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}
#pragma mark Block setting/getting methods
- (BOOL (^)(UITextField *))ycy_shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, YCYUITextFieldShouldBeginEditingKey);
}
- (void)setycy_shouldBegindEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCYUITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))ycy_shouldEndEditingBlock
{
    return objc_getAssociatedObject(self, YCYUITextFieldShouldEndEditingKey);
}
- (void)setycy_shouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCYUITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))ycy_didBeginEditingBlock
{
    return objc_getAssociatedObject(self, YCYUITextFieldDidBeginEditingKey);
}
- (void)setycy_didBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCYUITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))ycy_didEndEditingBlock
{
    return objc_getAssociatedObject(self, YCYUITextFieldDidEndEditingKey);
}
- (void)setycy_didEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCYUITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))ycy_shouldChangeCharactersInRangeBlock
{
    return objc_getAssociatedObject(self, YCYUITextFieldShouldChangeCharactersInRangeKey);
}
- (void)setycy_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCYUITextFieldShouldChangeCharactersInRangeKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))ycy_shouldReturnBlock
{
    return objc_getAssociatedObject(self, YCYUITextFieldShouldReturnKey);
}
- (void)setycy_shouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCYUITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))ycy_shouldClearBlock
{
    return objc_getAssociatedObject(self, YCYUITextFieldShouldClearKey);
}
- (void)setycy_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, YCYUITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}
#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextField will use blocks if no delegate is set.
 */
- (void)ycy_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UITextFieldDelegate>)[self class]) {
        objc_setAssociatedObject(self, YCYUITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}
@end
