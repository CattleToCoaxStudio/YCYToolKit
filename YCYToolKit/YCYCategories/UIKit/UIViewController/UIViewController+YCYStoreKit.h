//
//  UIViewController+YCYStoreKit.h
//
//  Created by ycy on 8/12/14.
//  Copyright (c) 2014 NULLS. All rights reserved.

#import <UIKit/UIKit.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Constants

#define affiliateToken @"10laQX"

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface UIViewController (YCYStoreKit)

@property NSString *ycy_campaignToken;
@property (nonatomic, copy) void (^ycy_loadingStoreKitItemBlock)(void);
@property (nonatomic, copy) void (^ycy_loadedStoreKitItemBlock)(void);


/**
 在应用内部打开appstore下载页面

 @param itemIdentifier SKStoreProductParameterITunesItemIdentifier是希望展示App的AppID，该Key所关联的值是一个NSNumber类型。支持iOS6以后的系统版本。
 */
- (void)ycy_presentStoreKitItemWithIdentifier:(NSInteger)itemIdentifier;

/**
 得到应用url

 @param identifier appid
 @return url
 */
+ (NSURL*)ycy_appURLForIdentifier:(NSInteger)identifier;

/**
 打开一个对应id的网页

 @param identifier appid
 */
+ (void)ycy_openAppURLForIdentifier:(NSInteger)identifier;

/**
 打开对应应用

 @param identifier appid
 */
+ (void)ycy_openAppReviewURLForIdentifier:(NSInteger)identifier;

/**
 判断是否itunes url

 @param URLString appid
 @return 判断
 */
+ (BOOL)ycy_containsITunesURLString:(NSString*)URLString;

/**
 返回id

 @param URLString url
 @return id
 */
+ (NSInteger)ycy_IDFromITunesURL:(NSString*)URLString;

@end
