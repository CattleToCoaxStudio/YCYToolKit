//
//  UITextField+History.h
//  Demo
//
//  Created by DamonDing on 15/5/26.
//  Copyright (c) 2015年 morenotepad. All rights reserved.
//
//  https://github.com/Jameson-zxm/UITextField-History
//   A category of UITextfiled that can record it's input as history

#import <UIKit/UIKit.h>

@interface UITextField (YCYHistory)
//文本框下面展示历史记录
/**
 *  identity of this textfield
 */
@property (retain, nonatomic) NSString *ycy_identify;

/**
 *  load textfiled input history
 *
 *
 *  @return the history of it's input
 */
- (NSArray*)ycy_loadHistroy;

/**
 *  save current input text
 */
- (void)ycy_synchronize;

- (void)ycy_showHistory;
- (void)ycy_hideHistroy;

- (void)ycy_clearHistory;

@end
