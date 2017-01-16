//
//  UIViewController+YCYStoreKit.h
//
//  Created by ycy on 8/12/14.
//  Copyright (c) 2014 NULLS. All rights reserved.


#import "UIViewController+YCYStoreKit.h"
#import "UIDevice+YCYHardware.h"
#import <objc/runtime.h>

#import <StoreKit/StoreKit.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Constants

NSString* const ycy_affiliateTokenKey = @"at";
NSString* const ycy_campaignTokenKey = @"ct";
NSString* const ycy_iTunesAppleString = @"itunes.apple.com";

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface UIViewController (SKStoreProductViewControllerDelegate) <SKStoreProductViewControllerDelegate>

@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation UIViewController (YCYStoreKit)

- (void)ycy_presentStoreKitItemWithIdentifier:(NSInteger)itemIdentifier
{
    SKStoreProductViewController* storeViewController = [[SKStoreProductViewController alloc] init];
    storeViewController.delegate = self;

    NSString* campaignToken = self.ycy_campaignToken ?: @"";

    NSDictionary* parameters = @{
        SKStoreProductParameterITunesItemIdentifier : @(itemIdentifier),
        ycy_affiliateTokenKey : ycy_affiliateTokenKey,
        ycy_campaignTokenKey : campaignToken,
    };

    if (self.ycy_loadingStoreKitItemBlock) {
        self.ycy_loadingStoreKitItemBlock();
    }
    [storeViewController loadProductWithParameters:parameters completionBlock:^(BOOL result, NSError* error) {
        if (self.ycy_loadedStoreKitItemBlock) {
            self.ycy_loadedStoreKitItemBlock();
        }

        if (result && !error)
        {
            [self presentViewController:storeViewController animated:YES completion:nil];
        }
    }];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Delegation - SKStoreProductViewControllerDelegate

- (void)ycy_productViewControllerDidFinish:(SKStoreProductViewController*)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

+ (NSURL*)ycy_appURLForIdentifier:(NSInteger)identifier
{
    NSString* appURLString = [NSString stringWithFormat:@"https://itunes.apple.com/app/id%li", (long)identifier];
    return [NSURL URLWithString:appURLString];
}

+ (void)ycy_openAppReviewURLForIdentifier:(NSInteger)identifier
{
    NSString* reviewURLString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%li", (long)identifier];
    
    if ([[UIDevice ycy_systemVersion] floatValue] < 10.0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:reviewURLString]];
    }else{
        //UIApplicationOpenURLOptionUniversalLinksOnly : @YES 当手机下载了该应用才开打 不是跳转safari
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:reviewURLString] options:@{UIApplicationOpenURLOptionUniversalLinksOnly : @YES} completionHandler:^(BOOL success) {
            
        }];
    }
    
}

+ (void)ycy_openAppURLForIdentifier:(NSInteger)identifier
{
    NSString* appURLString = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%li", (long)identifier];
    if ([[UIDevice ycy_systemVersion] floatValue] < 10.0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURLString]];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURLString] options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
}

+ (BOOL)ycy_containsITunesURLString:(NSString*)URLString
{
    return ([URLString rangeOfString:ycy_iTunesAppleString].location != NSNotFound);
}

+ (NSInteger)ycy_IDFromITunesURL:(NSString*)URLString
{
    NSError* error;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"id\\d+" options:0 error:&error];
    NSTextCheckingResult* match = [regex firstMatchInString:URLString options:0 range:NSMakeRange(0, URLString.length)];

    NSString* idString = [URLString substringWithRange:match.range];
    if (idString.length > 0) {
        idString = [idString stringByReplacingOccurrencesOfString:@"id" withString:@""];
    }

    return [idString integerValue];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Associated objects

- (void)setYcy_campaignToken:(NSString*)campaignToken
{
    objc_setAssociatedObject(self, @selector(setYcy_campaignToken:), campaignToken, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)ycy_campaignToken
{
    return objc_getAssociatedObject(self, @selector(setYcy_campaignToken:));
}

- (void)setYcy_loadingStoreKitItemBlock:(void (^)(void))loadingStoreKitItemBlock
{
    objc_setAssociatedObject(self, @selector(setYcy_loadingStoreKitItemBlock:), loadingStoreKitItemBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(void))ycy_loadingStoreKitItemBlock
{
    return objc_getAssociatedObject(self, @selector(setYcy_loadingStoreKitItemBlock:));
}

- (void)setYcy_loadedStoreKitItemBlock:(void (^)(void))loadedStoreKitItemBlock
{
    objc_setAssociatedObject(self, @selector(setYcy_loadedStoreKitItemBlock:), loadedStoreKitItemBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(void))ycy_loadedStoreKitItemBlock
{
    return objc_getAssociatedObject(self, @selector(setYcy_loadedStoreKitItemBlock:));
}

@end
