//
//  NSNotificationCenter+YCYMainThread.m
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "NSNotificationCenter+YCYMainThread.h"

@implementation NSNotificationCenter (YCYMainThread)

/**
 在主线程发送一条通知
 
 @param notification notification对象
 */
- (void)ycy_postNotificationOnMainThread:(NSNotification *)notification{
    [self performSelectorOnMainThread:@selector(postNotification:) withObject:notification waitUntilDone:YES];
}


/**
 发送通知
 
 @param aName 通知名称
 @param anObject 通知携带的对象
 */
- (void)ycy_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject];
    [self ycy_postNotificationOnMainThread:notification];
}


/**
 发送通知
 
 @param aName 通知名称
 @param anObject 通知携带的对象
 @param aUserInfo 通知携带的用户信息
 */
- (void)ycy_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo{
    NSNotification *notification = [NSNotification notificationWithName:aName object:anObject userInfo:aUserInfo];
    [self ycy_postNotificationOnMainThread:notification];
}

@end
