//
//  UITextField+YCYSelect.h
//
//  Created by ycy on 15/6/1.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YCYSelect)
/**
 *  @brief  当前选中的字符串范围
 *
 *  @return NSRange
 */
- (NSRange)ycy_selectedRange;
/**
 *  @brief  选中所有文字
 */
- (void)ycy_selectAllText;
/**
 *  @brief  选中指定范围的文字
 *
 *  @param range NSRange范围
 */
- (void)ycy_setSelectedRange:(NSRange)range;
@end
