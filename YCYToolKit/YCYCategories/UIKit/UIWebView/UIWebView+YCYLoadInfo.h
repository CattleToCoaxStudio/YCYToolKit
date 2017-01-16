//
//  UIWebView+YCYLoadInfo.h
//
//  Created by Jakey on 2016/12/9.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,YCYReadyState) {
    YCY_YCYReadyState_uninitialized = 0, //还未开始载入
    YCY_YCYReadyState_loading,      //载入中
    YCY_YCYReadyState_interactive, //已加载，文档与用户可以开始交互
    YCY_YCYReadyState_complete    //载入完成

};
typedef void(^ycy_webViewLoadChangeBlock)(UIWebView *webView,float progress,CGSize contentSize);

@interface UIWebView (YCYLoadInfo)<UIWebViewDelegate>
@property (nonatomic, readonly) float ycy_progress; // 0.0..1.0
@property (nonatomic, readonly) CGSize ycy_contentSize;
@property (nonatomic, readonly) YCYReadyState ycy_readyState;
@property (copy, nonatomic)     ycy_webViewLoadChangeBlock ycy_webViewLoadChangeBlock;

-(void)setYcy_webViewLoadChangeBlock:(ycy_webViewLoadChangeBlock)ycy_webViewLoadChangeBlock;
@end
