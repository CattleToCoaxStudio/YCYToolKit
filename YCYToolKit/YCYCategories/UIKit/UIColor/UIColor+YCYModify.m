//
//  UIColor+YCYModify.m
//
//  Created by Jakey on 15/1/2.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIColor+YCYModify.h"

@implementation UIColor (YCYModify)
- (UIColor *)ycy_invertedColor{
    NSArray *components = [self ycy_componentArray];
    return [UIColor colorWithRed:1-[components[0] doubleValue] green:1-[components[1] doubleValue] blue:1-[components[2] doubleValue] alpha:[components[3] doubleValue]];
}

- (UIColor *)ycy_colorForTranslucency{
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return [UIColor colorWithHue:hue saturation:saturation*1.158 brightness:brightness*0.95 alpha:alpha];
    //指定HSB，参数是：色调（hue），饱和的（saturation），亮度（brightness）
}

- (UIColor *)ycy_lightenColor:(CGFloat)lighten{
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return [UIColor colorWithHue:hue saturation:saturation*(1-lighten) brightness:brightness*(1+lighten) alpha:alpha];
}

- (UIColor *)ycy_darkenColor:(CGFloat)darken{
    CGFloat hue = 0, saturation = 0, brightness = 0, alpha = 0;
    [self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
    return [UIColor colorWithHue:hue saturation:saturation*(1+darken) brightness:brightness*(1-darken) alpha:alpha];
}

- (NSArray *)ycy_componentArray{
    CGFloat red, green, blue, alpha;
    const CGFloat *components = CGColorGetComponents([self CGColor]);
    if(CGColorGetNumberOfComponents([self CGColor]) == 2){
        red = components[0];
        green = components[0];
        blue = components[0];
        alpha = components[1];
    }else{
        red = components[0];
        green = components[1];
        blue = components[2];
        alpha = components[3];
    }
    return @[@(red), @(green), @(blue), @(alpha)];
}
@end
