//
//  UITextField+YCYBlocks.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UITextField (YCYBlocks)
@property (copy, nonatomic) BOOL (^ycy_shouldBegindEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^ycy_shouldEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^ycy_didBeginEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^ycy_didEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^ycy_shouldChangeCharactersInRangeBlock)(UITextField *textField, NSRange range, NSString *replacementString);
@property (copy, nonatomic) BOOL (^ycy_shouldReturnBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^ycy_shouldClearBlock)(UITextField *textField);

- (void)setYcy_shouldBegindEditingBlock:(BOOL (^)(UITextField *textField))shouldBegindEditingBlock;
- (void)setYcy_shouldEndEditingBlock:(BOOL (^)(UITextField *textField))shouldEndEditingBlock;
- (void)setYcy_didBeginEditingBlock:(void (^)(UITextField *textField))didBeginEditingBlock;
- (void)setYcy_didEndEditingBlock:(void (^)(UITextField *textField))didEndEditingBlock;
- (void)setYcy_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *textField, NSRange range, NSString *string))shouldChangeCharactersInRangeBlock;
- (void)setYcy_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock;
- (void)setYcy_shouldReturnBlock:(BOOL (^)(UITextField *textField))shouldReturnBlock;
@end
