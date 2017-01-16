//
//  UIWebView+YCYLoadStatus.m
//
//  Created by Jakey on 2016/12/9.
//  Copyright © 2016年 Jakey. All rights reserved.
//

#import "UIWebView+YCYLoadInfo.h"
#import <objc/runtime.h>

static const void *y_ycy_loadingCount = &y_ycy_loadingCount;
static const void *y_ycy_maxLoadCount = &y_ycy_maxLoadCount;
static const void *y_ycy_currentURL = &y_ycy_currentURL;
static const void *y_ycy_interactive = &y_ycy_interactive;
static const void *y_ycy_progress = &y_ycy_progress;
static const void *y_ycy_contentSize = &y_ycy_contentSize;

static const void *y_ycy_readyState = &y_ycy_readyState;

static const void *y_ycy_realDelegate = &y_ycy_realDelegate;
static const void *y_ycy_webViewLoadChangeBlock = &y_ycy_webViewLoadChangeBlock;


NSString *ycy_completeRPCURLPath = @"/ycywebviewprogressproxy/complete";

@implementation UIWebView (ycyLoadStatus)
-(void)setYcy_loadingCount:(NSUInteger)ycy_loadingCount{
    NSNumber *number = [[NSNumber alloc]initWithInteger:ycy_loadingCount];
    objc_setAssociatedObject(self,y_ycy_loadingCount, number, OBJC_ASSOCIATION_ASSIGN);
}

-(NSUInteger)ycy_loadingCount{
    return [objc_getAssociatedObject(self, y_ycy_loadingCount) integerValue];
}

-(void)setYcy_maxLoadCount:(NSUInteger)ycy_maxLoadCount{
    NSNumber *number = [[NSNumber alloc]initWithInteger:ycy_maxLoadCount];
    objc_setAssociatedObject(self,y_ycy_maxLoadCount, number, OBJC_ASSOCIATION_ASSIGN);
}

-(NSUInteger)ycy_maxLoadCount{
    return [objc_getAssociatedObject(self, y_ycy_maxLoadCount) integerValue];
}

-(void)setYcy_currentURL:(NSURL*)ycy_currentURL{
    objc_setAssociatedObject(self,y_ycy_currentURL, ycy_currentURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSURL*)ycy_currentURL{
    return objc_getAssociatedObject(self, y_ycy_currentURL) ;
}

-(void)setYcy_interactive:(BOOL)ycy_interactive{
    NSNumber *number = [[NSNumber alloc]initWithBool:ycy_interactive];
    objc_setAssociatedObject(self,y_ycy_interactive, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)ycy_interactive{
    return [objc_getAssociatedObject(self, y_ycy_interactive) boolValue];
}

-(void)setYcy_progress:(float)ycy_progress{
    NSNumber *number = [[NSNumber alloc]initWithFloat:ycy_progress];
    objc_setAssociatedObject(self,y_ycy_progress, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)ycy_progress{
    return [objc_getAssociatedObject(self, y_ycy_progress) floatValue];
}

-(void)setYcy_contentSize:(CGSize)ycy_contentSize{
    objc_setAssociatedObject(self,y_ycy_progress, NSStringFromCGSize(ycy_contentSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGSize)ycy_contentSize{
    return CGSizeFromString(objc_getAssociatedObject(self, y_ycy_progress));
}

-(void)setYcy_readyState:(YCYReadyState)ycy_readyState{
    objc_setAssociatedObject(self,y_ycy_readyState, @(ycy_readyState), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(YCYReadyState)ycy_readyState{
    return (YCYReadyState)[objc_getAssociatedObject(self, y_ycy_readyState) integerValue];
}

-(void)setYcy_realDelegate:(id<UIWebViewDelegate>)ycy_realDelegate{
    objc_setAssociatedObject(self,y_ycy_realDelegate, ycy_realDelegate, OBJC_ASSOCIATION_ASSIGN);
}

-(id<UIWebViewDelegate>)ycy_realDelegate{
    return objc_getAssociatedObject(self, y_ycy_realDelegate);
}

-(void (^)(UIWebView *, float))ycy_webViewLoadChangeBlock{
    return objc_getAssociatedObject(self, y_ycy_webViewLoadChangeBlock);
}

- (void)setYcy_webViewLoadChangeBlock:(ycy_webViewLoadChangeBlock)ycy_webViewLoadChangeBlock
{
    [self ycy_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, y_ycy_webViewLoadChangeBlock, ycy_webViewLoadChangeBlock, OBJC_ASSOCIATION_COPY);
}

#pragma mark --delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.path isEqualToString:ycy_completeRPCURLPath]) {
        [self ycy_completeProgress];
        return NO;
    }
    
    BOOL ret = YES;
    if ([self.ycy_realDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        ret = [self.ycy_realDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    
    BOOL isFragmentJump = NO;
    if (request.URL.fragment) {
        NSString *nonFragmentURL = [request.URL.absoluteString stringByReplacingOccurrencesOfString:[@"#" stringByAppendingString:request.URL.fragment] withString:@""];
        isFragmentJump = [nonFragmentURL isEqualToString:webView.request.URL.absoluteString];
    }
    
    BOOL isTopLevelNavigation = [request.mainDocumentURL isEqual:request.URL];
    
    BOOL isHTTPOrLocalFile = [request.URL.scheme isEqualToString:@"http"] || [request.URL.scheme isEqualToString:@"https"] || [request.URL.scheme isEqualToString:@"file"];
    if (ret && !isFragmentJump && isHTTPOrLocalFile && isTopLevelNavigation) {
        self.ycy_currentURL = request.URL;
        [self ycy_reset];
    }
    return ret;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.ycy_readyState = YCY_YCYReadyState_loading;

    if ([self.ycy_realDelegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [self.ycy_realDelegate webViewDidStartLoad:webView];
    }
    
    self.ycy_loadingCount++;
    self.ycy_maxLoadCount = fmax(self.ycy_maxLoadCount, self.ycy_loadingCount);
    [self ycy_startProgress];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if ([self.ycy_realDelegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [self.ycy_realDelegate webViewDidFinishLoad:webView];
    }
   
    self.ycy_loadingCount--;
    [self ycy_incrementProgress];
    
    NSString *readyState = [webView stringByEvaluatingJavaScriptFromString:@"document.readyState"];
    
    BOOL interactive = [readyState isEqualToString:@"interactive"];
    if (interactive) {
        self.ycy_interactive = YES;
        self.ycy_readyState = YCY_YCYReadyState_interactive;
        
        NSString *waitForCompleteJS = [NSString stringWithFormat:@"window.addEventListener('load',function() { var iframe = document.createElement('iframe'); iframe.style.display = 'none'; iframe.src = '%@://%@%@'; document.body.appendChild(iframe);  }, false);", webView.request.mainDocumentURL.scheme, webView.request.mainDocumentURL.host, ycy_completeRPCURLPath];
        [webView stringByEvaluatingJavaScriptFromString:waitForCompleteJS];
    }
    
    BOOL isNotRedirect = self.ycy_currentURL && [self.ycy_currentURL isEqual:webView.request.mainDocumentURL];
    BOOL complete = [readyState isEqualToString:@"complete"];
    if (complete && isNotRedirect) {
        [self ycy_completeProgress];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if ([self.ycy_realDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [self.ycy_realDelegate webView:webView didFailLoadWithError:error];
    }
    
    self.ycy_loadingCount--;
    [self ycy_incrementProgress];
    
    NSString *readyState = [webView stringByEvaluatingJavaScriptFromString:@"document.readyState"];
    
    BOOL interactive = [readyState isEqualToString:@"interactive"];
    if (interactive) {
        self.ycy_interactive = YES;
        NSString *waitForCompleteJS = [NSString stringWithFormat:@"window.addEventListener('load',function() { var iframe = document.createElement('iframe'); iframe.style.display = 'none'; iframe.src = '%@://%@%@'; document.body.appendChild(iframe);  }, false);", webView.request.mainDocumentURL.scheme, webView.request.mainDocumentURL.host, ycy_completeRPCURLPath];
        [webView stringByEvaluatingJavaScriptFromString:waitForCompleteJS];
    }
    
    BOOL isNotRedirect = self.ycy_currentURL && [self.ycy_currentURL isEqual:webView.request.mainDocumentURL];
    BOOL complete = [readyState isEqualToString:@"complete"];
    if ((complete && isNotRedirect) || error) {
        [self ycy_completeProgress];
    }
}

- (void)ycy_startProgress
{
    if (self.ycy_progress < 0.1) {
        [self ycy_updateProgress:0.1];
    }
}
- (void)ycy_incrementProgress
{
    float progress = self.ycy_progress;
    float maxProgress = self.ycy_interactive ? 0.9 : 0.5f;
    float remainPercent = (float)self.ycy_loadingCount / (float)self.ycy_maxLoadCount;
    float increment = (maxProgress - progress) * remainPercent;
    progress += increment;
    progress = fmin(progress, maxProgress);
    [self ycy_updateProgress:progress];
}

- (void)ycy_completeProgress
{
    self.ycy_readyState = YCY_YCYReadyState_complete;
    [self ycy_updateProgress:1.0];
//    CGFloat webViewHeight= [[self stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"]floatValue];
//    NSLog(@"body.offsetHeight:%lf",webViewHeight);
//    
//    CGFloat webViewHeight2=self.scrollView.contentSize.height;
//    NSLog(@"scrollView contentSize:%lf",webViewHeight2);
}

- (void)ycy_updateProgress:(float)progress
{
    if (progress > self.ycy_progress || progress == 0) {
        self.ycy_progress = progress;
        if (self.ycy_webViewLoadChangeBlock) {
           self.ycy_webViewLoadChangeBlock(self,progress,self.scrollView.contentSize);
        }
    }
}
- (void)ycy_reset
{
    self.ycy_maxLoadCount = self.ycy_loadingCount = 0;
    self.ycy_interactive = NO;
    [self ycy_updateProgress:0.0];
    self.ycy_readyState = YCY_YCYReadyState_uninitialized;
}
//会影响未包含头文件的webview
//-(void)awakeFromNib{
//    [super awakeFromNib];
//    [self ycy_setDelegateIfNoDelegateSet];
//}
//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self ycy_setDelegateIfNoDelegateSet];
//    }
//    return self;
//}
#pragma mark - Delegate Forwarder
- (void)ycy_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UIWebViewDelegate>)self) {
        self.ycy_realDelegate  = self.delegate;
        self.delegate = (id<UIWebViewDelegate>)self;
    }
}


//- (void)setDelegate:(id<UIWebViewDelegate>)delegate {
//    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0){
//        // UIScrollView delegate keeps some flags that mark whether the delegate implements some methods (like scrollViewDidScroll:)
//        // setting *the same* delegate doesn't recheck the flags, so it's better to simply nil the previous delegate out
//        // we have to setup the realDelegate at first, since the flag check happens in setter
////        [super setDelegate:nil];
////        self.delegate = nil;
//        self.ycy_realDelegate = delegate != self ? delegate : nil;
////        [super setDelegate:delegate ? self : nil];
//        self.delegate = delegate ? self : nil;
//        
//    }else {
////        [super setDelegate:delegate];
////        self.delegate = delegate;
//
//    }
//}

//- (BOOL)respondsToSelector:(SEL)selector {
//    return [super respondsToSelector:selector] || [self.ycy_realDelegate respondsToSelector:selector];
//}
//- (id)forwardingTargetForSelector:(SEL)selector {
//    id delegate = self.ycy_realDelegate;
//    return [delegate respondsToSelector:selector] ? delegate : [super forwardingTargetForSelector:selector];
//}
@end
