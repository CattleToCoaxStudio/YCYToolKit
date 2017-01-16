//
//  NSTimer+YCYAddition.h
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (YCYAddition)
/**
 *  @brief  暂停NSTimer
 */
- (void)ycy_pauseTimer;
/**
 *  @brief  开始NSTimer
 */
- (void)ycy_resumeTimer;
/**
 *  @brief  延迟开始NSTimer
 */
- (void)ycy_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
