//
//  UITextField+YCYInputLimit.h
//
//  Created by ycy on 2016/11/29.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YCYInputLimit)

/**
 限制输入字符长度
 */
@property (assign, nonatomic)  NSInteger ycy_maxLength;//if <=0, no limit
@end
