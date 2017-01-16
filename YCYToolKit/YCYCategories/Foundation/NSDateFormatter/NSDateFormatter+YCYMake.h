//
//  NSDateFormatter+YCYMake.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (YCYMake)

/**
 初始化日期格式

 @param format 样式 @"yyyy-MM-dd HH:mm:ss";
 @return <#return value description#>
 */
+(NSDateFormatter *)ycy_dateFormatterWithFormat:(NSString *)format;
+(NSDateFormatter *)ycy_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;


/**
 初始化

 @param format 样式
 @param timeZone 时区  GMT北京时区  如果发现差小时 的话 时区问题
 @param locale 地区
 @return <#return value description#>
 */
+(NSDateFormatter *)ycy_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

+(NSDateFormatter *)ycy_dateFormatterWithDateStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)ycy_dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;
+(NSDateFormatter *)ycy_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;
+(NSDateFormatter *)ycy_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;

@end
