//
//  NSRunLoop+YCYPerformBlock.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//
/* 使用
 - (void)testPerformBlockAndWait
 {
 // 1
 __block BOOL flag = NO;
 
 [[NSRunLoop currentRunLoop] performBlockAndWait:^(BOOL *finish) {
 double delayInSeconds = 2.0;
 dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
 dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 dispatch_after(popTime, queue, ^(void){
 // 2
 flag = YES;
 *finish = YES;
 });
 }];
 
 // 3
 XCTAssertTrue(flag);
 }
 */
#import <Foundation/Foundation.h>

extern NSString *const NSRunloopTimeoutException;

@interface NSRunLoop (YCYPerformBlock)


/**
 将要执行代码的代码放入block中设置超时时间 默认10s

 @param block 回调
 */
- (void)ycy_performBlockAndWait:(void (^)(BOOL *finish))block;


/**
 将要执行代码的代码放入block中设置超时时间

 @param block 回调
 @param timeoutInterval 超时时长
 */
- (void)ycy_performBlockAndWait:(void (^)(BOOL *finish))block timeoutInterval:(NSTimeInterval)timeoutInterval;


@end
