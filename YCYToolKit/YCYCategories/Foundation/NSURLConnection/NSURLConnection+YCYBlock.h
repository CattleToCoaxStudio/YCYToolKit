//
//  NSURLConnection+YCYBlock.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (YCYBlock)

/**
 发起异步请求   ios9.0 被弃用 被NSURLSession代替

 @param request  NSURLRequest
 @param queue  线程池 NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self
 selector:@selector(downloadImage:)
 object:kURL];   NSOperationQueue *queue = [[NSOperationQueue alloc] init];     [queue addOperation:operation];  后台执行downloadImage这个方法
 @param handler 回调
 */
+ (void)ycy_sendAsynchronousRequestAcceptingAllCerts:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))handler;




@end
