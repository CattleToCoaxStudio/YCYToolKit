//
//  UIViewController+YCYVisible.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YCYVisible)

/**
 判断当前view是否有效 返回no 可以设置view = nil释放内存 yes说明在屏幕上 在收到内存警告时可以使用此方法

 @return 当前view是否有效
 */
- (BOOL)ycy_isVisible;

@end
