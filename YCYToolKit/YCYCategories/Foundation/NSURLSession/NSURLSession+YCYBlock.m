//
//  NSURLSession+YCYBlock.m
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "NSURLSession+YCYBlock.h"

@implementation NSURLSession (YCYBlock)

+ (void)ycy_sendGetRequestAcceptingAllCerts:(NSURLRequest *)request andParam:(NSDictionary *)param completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))handler
{
    //    // 1.创建一个网络路径
    //    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://172.16.2.254/php/phonelogin?yourname=%@&yourpas=%@&btn=login",yourname,yourpass]];
    //    // 2.创建一个网络请求
    //    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.根据会话对象，创建一个Task任务
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"从服务器获取到数据");
        /*
         对从服务器获取到的数据data进行相应的处理.
         */
        handler(response,data,error);
    }];
    //5.最后一步，执行任务，(resume也是继续执行)。
    [sessionDataTask resume];
}

+(void)ycy_sendPostRequestAcceptingAllCerts:(NSMutableURLRequest *)request andParam:(NSDictionary *)param completionHandler:(void (^)(NSURLResponse *, NSData *, NSError *))handler{
    // 1.创建一个网络路径
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://172.16.2.254/php/phonelogin"]];
//    // 2.创建一个网络请求，分别设置请求方法、请求参数
//    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod=@"POST";
    NSString *paramStr = @"";
    for (NSString *key in param.allKeys) {
        NSString *value = [param valueForKey:key];
        [paramStr stringByAppendingString:[NSString stringWithFormat:@"%@=%@",key,value]];
    }
    if (param.allKeys > 0) {
        request.HTTPBody=[paramStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    // 3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.根据会话对象，创建一个Task任务
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"从服务器获取到数据");
        /*
         对从服务器获取到的数据data进行相应的处理.
         */
        handler(response,data,error);
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:nil];
    }];
    //5.最后一步，执行任务，(resume也是继续执行)。
    [sessionDataTask resume];
}

@end
