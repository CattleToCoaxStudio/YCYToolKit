//
//  UITextField+ycyInputLimit.m
//
//  Created by Jakey on 2016/11/29.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UITextField+YCYInputLimit.h"
#import <objc/runtime.h>

static const void *YCYTextFieldInputLimitMaxLength = &YCYTextFieldInputLimitMaxLength;
@implementation UITextField (YCYInputLimit)

- (NSInteger)ycy_maxLength {
    return [objc_getAssociatedObject(self, YCYTextFieldInputLimitMaxLength) integerValue];
}
- (void)setYcy_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, YCYTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(ycy_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)ycy_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.ycy_maxLength > 0 && toBeString.length > self.ycy_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.ycy_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.ycy_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.ycy_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.ycy_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}
@end
