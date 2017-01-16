//
//  UIViewController+YCYBackButtonItemTitle.h
//
//  Created by ycy on 15/8/6.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YCYBackButtonItemTitleProtocol <NSObject>

@optional

/**
 设置返回按钮标题

 @return 标题字符串
 */
- (NSString *)ycy_navigationItemBackBarButtonTitle;
//长度有限 否则设置为"back"

@end

@interface UIViewController (YCYBackButtonItemTitle) <YCYBackButtonItemTitleProtocol>

@end
