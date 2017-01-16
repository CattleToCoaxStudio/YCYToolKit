//
//  UIScreen+YCYFrame.m
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIScreen+YCYFrame.h"

@implementation UIScreen (YCYFrame)
+ (CGSize)ycy_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)ycy_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)ycy_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)ycy_orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? ycy_SizeSWAP([UIScreen ycy_size]) : [UIScreen ycy_size];
}

+ (CGFloat)ycy_orientationWidth
{
    return [UIScreen ycy_orientationSize].width;
}

+ (CGFloat)ycy_orientationHeight
{
    return [UIScreen ycy_orientationSize].height;
}

+ (CGSize)ycy_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize ycy_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}
@end
