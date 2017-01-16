//
//  UIControl+YCYSound.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (YCYSound)

/**
 不同事件增加不同声音

 @param name 文件名   在main boundle下
 @param controlEvent 事件类型
 */
- (void)ycy_setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent;

@end
