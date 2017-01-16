//
//  UIView+YCYTable.h
//  Category
//
//  Created by yangchengyou on 17/1/11.
//  Copyright © 2017年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YCYLineType) {
    YCYLineVertical,  // 垂直
    YCYLineHorizontal // 水平
};

@interface UIView (YCYTable)

/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas;

/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 * lineInfo：行信息，传入格式：@{@"0" : @"3"}意味着第一行创建3个格子
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas lineInfo:(NSDictionary *)lineInfo;

/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 * colorInfo：颜色信息，传入格式：@{@"0" : [UIColor redColor]}意味着第一个格子文字将会变成红色
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas colorInfo:(NSDictionary *)colorInfo;
/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 * colorInfo：颜色信息，传入格式：@{@"0" : [UIColor redColor]}意味着第一个格子文字将会变成红色
 * lineInfo：行信息，传入格式：@{@"0" : @"3"}意味着第一行创建3个格子
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas colorInfo:(NSDictionary *)colorInfo lineInfo:(NSDictionary *)lineInfo;
/**
 * 创建一个表格
 * line：列数
 * columns：行数
 * data：数据
 * colorInfo：颜色信息，传入格式：@{@"0" : [UIColor redColor]}意味着第一个格子文字将会变成红色
 * lineInfo：行信息，传入格式：@{@"0" : @"3"}意味着第一行创建3个格子
 * backgroundColorInfo：行信息，传入格式：@{@"0" : [UIColor redColor]}意味着第一个格子背景颜色变成红色
 */
- (void)ycy_drawListWithRect:(CGRect)rect line:(NSInteger)line columns:(NSInteger)columns datas:(NSArray *)datas colorInfo:(NSDictionary *)colorInfo lineInfo:(NSDictionary *)lineInfo backgroundColorInfo:(NSDictionary *)backgroundColorInfo;
/**
 * 获取第index个格子的label
 */
- (UILabel *)getLabelWithIndex:(NSInteger)index;

/**
 * 画一条线
 * frame: 线的frame
 * color：线的颜色
 * lineWidth：线宽
 */
- (void)ycy_drawLineWithFrame:(CGRect)frame lineType:(YCYLineType)lineType color:(UIColor *)color lineWidth:(CGFloat)lineWidth;

@end
