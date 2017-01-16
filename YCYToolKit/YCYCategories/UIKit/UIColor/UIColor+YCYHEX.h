//
//  UIColor+YCYHEX.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YCYHEX)
+ (UIColor *)ycy_colorWithHex:(UInt32)hex;
+ (UIColor *)ycy_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)ycy_colorWithHexString:(NSString *)hexString;
- (NSString *)ycy_HEXString;
///值不需要除以255.0
+ (UIColor *)ycy_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;
///值不需要除以255.0
+ (UIColor *)ycy_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;
@end
