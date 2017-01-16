//
//  UIWebView+YCYWebStorage.h
//
//  Created by Jakey on 2016/12/14.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//  https://github.com/cprime/UIWebView-WebStorage

#import <UIKit/UIKit.h>

@interface UIWebView (YCYWebStorage)
#pragma mark - Local Storage

/**
 本地web存储

 @param string 值
 @param key 键
 */
- (void)ycy_setLocalStorageString:(NSString *)string forKey:(NSString *)key;

- (NSString *)ycy_localStorageStringForKey:(NSString *)key;

- (void)ycy_removeLocalStorageStringForKey:(NSString *)key;

- (void)ycy_clearLocalStorage;

#pragma mark - Session Storage

- (void)ycy_setSessionStorageString:(NSString *)string forKey:(NSString *)key;

- (NSString *)ycy_sessionStorageStringForKey:(NSString *)key;

- (void)ycy_removeSessionStorageStringForKey:(NSString *)key;

- (void)ycy_clearSessionStorage;

@end
