//
//  UIWebView+YCYBlocks.m
//
//  Created by Shai Mishali on 1/1/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "UIWebView+YCYBlocks.h"

static void (^__ycy_loadedBlock)(UIWebView *webView);
static void (^__ycy_failureBlock)(UIWebView *webView, NSError *error);
static void (^__ycy_loadStartedBlock)(UIWebView *webView);
static BOOL (^__ycy_shouldLoadBlock)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType);

static uint __ycy_loadedWebItems;

@implementation UIWebView (YCYBlock)

#pragma mark - UIWebView+Blocks

+(UIWebView *)ycy_loadRequest:(NSURLRequest *)request
                   loaded:(void (^)(UIWebView *webView))loadedBlock
                   failed:(void (^)(UIWebView *webView, NSError *error))failureBlock{

    return [self ycy_loadRequest:request loaded:loadedBlock failed:failureBlock loadStarted:nil shouldLoad:nil];
}

+(UIWebView *)ycy_loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *webView))loadedBlock
                      failed:(void (^)(UIWebView *webView, NSError *error))failureBlock{
    
    return [self ycy_loadHTMLString:htmlString loaded:loadedBlock failed:failureBlock loadStarted:nil shouldLoad:nil];
}

+(UIWebView *)ycy_loadHTMLString:(NSString *)htmlString
                      loaded:(void (^)(UIWebView *))loadedBlock
                      failed:(void (^)(UIWebView *, NSError *))failureBlock
                 loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
                  shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock{
    __ycy_loadedWebItems = 0;
    __ycy_loadedBlock = loadedBlock;
    __ycy_failureBlock = failureBlock;
    __ycy_loadStartedBlock = loadStartedBlock;
    __ycy_shouldLoadBlock = shouldLoadBlock;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = (id)[self class];
    [webView loadHTMLString:htmlString baseURL:nil];
    
    return webView;
}

+(UIWebView *)ycy_loadRequest:(NSURLRequest *)request
                   loaded:(void (^)(UIWebView *webView))loadedBlock
                   failed:(void (^)(UIWebView *webView, NSError *error))failureBlock
              loadStarted:(void (^)(UIWebView *webView))loadStartedBlock
               shouldLoad:(BOOL (^)(UIWebView *webView, NSURLRequest *request, UIWebViewNavigationType navigationType))shouldLoadBlock{
    __ycy_loadedWebItems    = 0;
    
    __ycy_loadedBlock       = loadedBlock;
    __ycy_failureBlock      = failureBlock;
    __ycy_loadStartedBlock  = loadStartedBlock;
    __ycy_shouldLoadBlock   = shouldLoadBlock;
    
    UIWebView *webView  = [[UIWebView alloc] init];
    webView.delegate    = (id) [self class];
    
    [webView loadRequest: request];
    
    return webView;
}

#pragma mark - Private Static delegate
+(void)webViewDidFinishLoad:(UIWebView *)webView{
    __ycy_loadedWebItems--;
    
    if(__ycy_loadedBlock && (!TRUE_END_REPORT || __ycy_loadedWebItems == 0)){
        __ycy_loadedWebItems = 0;
        __ycy_loadedBlock(webView);
    }
}

+(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{    
    __ycy_loadedWebItems--;
    
    if(__ycy_failureBlock)
        __ycy_failureBlock(webView, error);
}

+(void)webViewDidStartLoad:(UIWebView *)webView{    
    __ycy_loadedWebItems++;
    
    if(__ycy_loadStartedBlock && (!TRUE_END_REPORT || __ycy_loadedWebItems > 0))
        __ycy_loadStartedBlock(webView);
}

+(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if(__ycy_shouldLoadBlock)
        return __ycy_shouldLoadBlock(webView, request, navigationType);
    
    return YES;
}

@end
