//
//  UIButton+YCYCountDown.h
//
//  Created by ycy on 15/3/17.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YCYCountDown)

/**
 开始倒计时 如：60s

 @param timeout 倒计时时间   如：60
 @param tittle 倒计时结束后的title
 @param waitTittle 倒计时的时间单位  如：s
 */
-(void)ycy_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;
@end
