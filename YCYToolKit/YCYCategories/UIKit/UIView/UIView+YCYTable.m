//
//  UIView+YCYTable.m
//  Category
//
//  Created by yangchengyou on 17/1/11.
//  Copyright © 2017年 NULLS. All rights reserved.
//

#import "UIView+YCYTable.h"

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

#define YCYTag 155158
@implementation UIView (YCYTable)
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas colorInfo:(NSDictionary *)colorInfo{
    [self ycy_drawListWithRect:rect line:line columns:columns datas:datas colorInfo:colorInfo lineInfo:nil];
}

- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas colorInfo:(NSDictionary *)colorInfo lineInfo:(NSDictionary *)lineInfo {
    [self ycy_drawListWithRect:rect line:line columns:columns datas:datas colorInfo:colorInfo lineInfo:lineInfo backgroundColorInfo:nil];
}

/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 * colorInfo：颜色信息，传入格式：@{@"0" : [UIColor redColor]}意味着第一个格子文字将会变成红色
 * lineInfo：行信息，传入格式：@{@"0" : @"3"}意味着第一行创建3个格子
 * backgroundColorInfo：行信息，传入格式：@{@"0" : [UIColor redColor]}意味着第一个格子背景颜色变成红色
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas colorInfo:(NSDictionary *)colorInfo lineInfo:(NSDictionary *)lineInfo backgroundColorInfo:(NSDictionary *)backgroundColorInfo {
    NSInteger index = 0;
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat h = (1.0) * rect.size.height / columns;
    NSInteger newLine = 0;
    for (NSInteger i = 0; i < columns; i++) {
        
        // 判断合并单元格
        if (lineInfo) {
            for (NSInteger a = 0; a < lineInfo.allKeys.count; a++) {
                
                // 新的列数
                NSInteger newColumn = [lineInfo.allKeys[a] integerValue];
                if (i == newColumn) {
                    newLine = [lineInfo[lineInfo.allKeys[a]] integerValue];
                } else {
                    newLine = line;
                }
            }
        } else {
            newLine = line;
        }
        
        
        for (NSInteger j = 0; j < newLine; j++) {
            
            // 线宽
            CGFloat w = (1.0) * rect.size.width / newLine;
            CGRect frame = (CGRect){x + w * j, y + h * i, w, h};
            
            // 画线
            [self ycy_drawRectWithRect:frame];
            
            // 创建label
            UILabel *label = [[UILabel alloc] initWithFrame:frame];
            
            // 文字居中
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            
            // 判断文字颜色
            UIColor *textColor = [colorInfo objectForKey:[NSString stringWithFormat:@"%zd", index]];
            if (!textColor) {
                textColor = [UIColor grayColor];
            }
            label.textColor = textColor;
            
            // 判断背景颜色
            UIColor *backgroundColor = [backgroundColorInfo objectForKey:[NSString stringWithFormat:@"%zd", index]];
            if (!backgroundColor) {
                backgroundColor = [UIColor clearColor];
            }
            label.backgroundColor = backgroundColor;
            
            // 字体大小
            label.font = [UIFont systemFontOfSize:13];
            
            // label文字
            label.text = datas[index];
            
            // label的tag值
            label.tag = YCYTag + index;
            index++;
        }
    }
}

- (void)ycy_drawRectWithRect:(CGRect)rect {
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat w = (1.0) * rect.size.width;
    CGFloat h = (1.0) * rect.size.height;
    
    if (((int)(y * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
        y += SINGLE_LINE_ADJUST_OFFSET;
    }
    if (((int)(x * [UIScreen mainScreen].scale) + 1) % 2 == 0) {
        x += SINGLE_LINE_ADJUST_OFFSET;
    }
    
    [self ycy_drawLineWithFrame:(CGRect){x, y, w, 1} type:1];
    [self ycy_drawLineWithFrame:(CGRect){x + w, y, 1, h} type:2];
    [self ycy_drawLineWithFrame:(CGRect){x, y + h, w, 1} type:1];
    [self ycy_drawLineWithFrame:(CGRect){x, y, 1, h} type:2];
}

- (void)ycy_drawLineWithFrame:(CGRect)frame lineType:(YCYLineType)lineType color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    
    // 创建贝塞尔曲线
    UIBezierPath *linePath = [[UIBezierPath alloc] init];
    
    // 线宽
    linePath.lineWidth = lineWidth;
    
    // 起点
    [linePath moveToPoint:CGPointMake(0, 0)];
    
    // 重点：判断是水平方向还是垂直方向
    [linePath addLineToPoint: lineType == YCYLineHorizontal ? CGPointMake(frame.size.width, 0) : CGPointMake(0, frame.size.height)];
    
    // 创建CAShapeLayer
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    
    // 颜色
    lineLayer.strokeColor = color.CGColor;
    // 宽度
    lineLayer.lineWidth = lineWidth;
    
    // frame
    lineLayer.frame = frame;
    
    // 路径
    lineLayer.path = linePath.CGPath;
    
    // 添加到layer上
    [self.layer addSublayer:lineLayer];
}

- (void)ycy_drawLineWithFrame:(CGRect)frame type:(NSInteger)type color:(UIColor *)color {
    [self ycy_drawLineWithFrame:frame lineType:type color:color lineWidth:0.7];
}

- (void)ycy_drawLineWithFrame:(CGRect)frame type:(NSInteger)type {
    [self ycy_drawLineWithFrame:frame type:type color:[UIColor blackColor]];
}

/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas {
    [self ycy_drawListWithRect:rect line:line columns:columns datas:datas colorInfo:nil];
}

/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 * lineInfo：行信息，传入格式：@{@"0" : @"3"}意味着第一行创建3个格子
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas lineInfo:(NSDictionary *)lineInfo {
    [self ycy_drawListWithRect:rect line:line columns:columns datas:datas colorInfo:nil lineInfo:lineInfo];
}

// 根据tag拿到对应的label
- (UILabel *)getLabelWithIndex:(NSInteger)index {
    
    // 为了防止self的subviews又重复的tag，拿到第一个
    for (UIView *v in self.subviews) {
        
        // 判断是否为label类
        if ([v isKindOfClass:[UILabel class]]) {
            
            // 强制转换
            UILabel *label = (UILabel *)v;
            if (v.tag == index + YCYTag) {
                return label;
            }
        }
    }
    return [self viewWithTag:index + YCYTag];
}
@end
