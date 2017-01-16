//
//  UIButton+YCYCountDown.h
//
//  Created by ycy on 15/3/17.
//  Copyright (c) 2015年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YCYCountDown)
-(void)ycy_startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;
@end
