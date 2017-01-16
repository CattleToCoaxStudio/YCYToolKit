//
//  UIResponder+YCYFirstResponder.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (YCYFirstResponder)

/**
 第一响应者

 @return 第一响应者
 */
+ (id)ycy_currentFirstResponder;

@end
