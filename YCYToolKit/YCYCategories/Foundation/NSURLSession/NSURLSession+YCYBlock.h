//
//  NSURLSession+YCYBlock.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSession (YCYBlock)


/**
 发起get请求  iOS9后代替NSURLConnection

 @param request NSURLRequest
 @param handler 回调
 */
+ (void)ycy_sendGetRequestAcceptingAllCerts:(NSURLRequest *)request andParam:(NSDictionary *)param completionHandler:(void (^)(NSURLResponse * response, NSData * data, NSError * error))handler;


/**
 发起post请求

 @param request request
 @param param 参数
 @param handler 回调
 */
+ (void)ycy_sendPostRequestAcceptingAllCerts:(NSMutableURLRequest *)request andParam:(NSDictionary *)param completionHandler:(void (^)(NSURLResponse * response, NSData * data, NSError * error))handler;
@end
