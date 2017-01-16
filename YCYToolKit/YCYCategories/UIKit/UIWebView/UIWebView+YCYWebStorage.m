//
//  UIWebView+YCYWebStorage.m
//
//  Created by Jakey on 2016/12/14.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "UIWebView+YCYWebStorage.h"

static NSString * const ycy_kLocalStorageName = @"localStorage";
static NSString * const ycy_kSessionStorageName = @"sessionStorage";


@implementation UIWebView (YCYWebStorage)
#pragma mark - Local Storage

- (void)ycy_setLocalStorageString:(NSString *)string forKey:(NSString *)key {
    [self ycy_ip_setString:string forKey:key storage:ycy_kLocalStorageName];
}

- (NSString *)ycy_localStorageStringForKey:(NSString *)key {
    return [self ycy_ip_stringForKey:key storage:ycy_kLocalStorageName];
}

- (void)ycy_removeLocalStorageStringForKey:(NSString *)key {
    [self ycy_ip_removeStringForKey:key storage:ycy_kLocalStorageName];
}

- (void)ycy_clearLocalStorage {
    [self ycy_ip_clearWithStorage:ycy_kLocalStorageName];
}

#pragma mark - Session Storage

- (void)ycy_setSessionStorageString:(NSString *)string forKey:(NSString *)key {
    [self ycy_ip_setString:string forKey:key storage:ycy_kSessionStorageName];
}

- (NSString *)ycy_sessionStorageStringForKey:(NSString *)key {
    return [self ycy_ip_stringForKey:key storage:ycy_kSessionStorageName];
}

- (void)ycy_removeSessionStorageStringForKey:(NSString *)key {
    [self ycy_ip_removeStringForKey:key storage:ycy_kSessionStorageName];
}

- (void)ycy_clearSessionStorage {
    [self ycy_ip_clearWithStorage:ycy_kSessionStorageName];
}

#pragma mark - Helpers

- (void)ycy_ip_setString:(NSString *)string forKey:(NSString *)key storage:(NSString *)storage {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.setItem('%@', '%@');", storage, key, string]];
}

- (NSString *)ycy_ip_stringForKey:(NSString *)key storage:(NSString *)storage {
    return [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.getItem('%@');", storage, key]];
}

- (void)ycy_ip_removeStringForKey:(NSString *)key storage:(NSString *)storage {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.removeItem('%@');", storage, key]];
}

- (void)ycy_ip_clearWithStorage:(NSString *)storage {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@.clear();", storage]];
}
@end
