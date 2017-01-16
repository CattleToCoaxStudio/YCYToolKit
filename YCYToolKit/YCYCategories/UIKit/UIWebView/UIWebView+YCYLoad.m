//
//  UIWebView+YCYLoadURL.m
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIWebView+YCYLoad.h"

@implementation UIWebView (YCYLoad)
/**
 *  @brief  读取一个网页地址
 *
 *  @param URLString 网页地址
 */
- (void)ycy_loadURL:(NSString*)URLString{
    NSString *encodedUrl = (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes (NULL, (__bridge CFStringRef) URLString, NULL, NULL,kCFStringEncodingUTF8);
    NSURL *url = [NSURL URLWithString:encodedUrl];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self loadRequest:req];
}
/**
 *  @brief  读取bundle中的webview
 *
 *  @param htmlName webview名称
 */
- (void)ycy_loadLocalHtml:(NSString*)htmlName{
    [self ycy_loadLocalHtml:htmlName inBundle:[NSBundle mainBundle]];
}
- (void)ycy_loadLocalHtml:(NSString*)htmlName inBundle:(NSBundle*)inBundle{
    NSString *filePath = [inBundle pathForResource:htmlName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self loadRequest:request];
}
/**
 *  @brief  清空cookie
 */
- (void)ycy_clearCookies
{
    NSHTTPCookieStorage *storage = NSHTTPCookieStorage.sharedHTTPCookieStorage;
    
    for (NSHTTPCookie *cookie in storage.cookies)
        [storage deleteCookie:cookie];
    
    [NSUserDefaults.standardUserDefaults synchronize];
}
@end
