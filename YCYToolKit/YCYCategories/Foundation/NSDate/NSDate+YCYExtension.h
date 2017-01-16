//
//  NSDate+Extension.h
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YCYExtension)


/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)ycy_day;
- (NSUInteger)ycy_month;
- (NSUInteger)ycy_year;
- (NSUInteger)ycy_hour;
- (NSUInteger)ycy_minute;
- (NSUInteger)ycy_second;
+ (NSUInteger)ycy_day:(NSDate *)date;
+ (NSUInteger)ycy_month:(NSDate *)date;
+ (NSUInteger)ycy_year:(NSDate *)date;
+ (NSUInteger)ycy_hour:(NSDate *)date;
+ (NSUInteger)ycy_minute:(NSDate *)date;
+ (NSUInteger)ycy_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)ycy_daysInYear;
+ (NSUInteger)ycy_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)ycy_isLeapYear;
+ (BOOL)ycy_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)ycy_weekOfYear;
+ (NSUInteger)ycy_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)ycy_formatYMD;
+ (NSString *)ycy_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)ycy_weeksOfMonth;
+ (NSUInteger)ycy_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)ycy_begindayOfMonth;
+ (NSDate *)ycy_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)ycy_lastdayOfMonth;
+ (NSDate *)ycy_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)ycy_dateAfterDay:(NSUInteger)day;
+ (NSDate *)ycy_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)ycy_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)ycy_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)ycy_offsetYears:(int)numYears;
+ (NSDate *)ycy_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)ycy_offsetMonths:(int)numMonths;
+ (NSDate *)ycy_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)ycy_offsetDays:(int)numDays;
+ (NSDate *)ycy_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)ycy_offsetHours:(int)hours;
+ (NSDate *)ycy_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)ycy_daysAgo;
+ (NSUInteger)ycy_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)ycy_weekday;
+ (NSInteger)ycy_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)ycy_dayFromWeekday;
+ (NSString *)ycy_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)ycy_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)ycy_isToday;

/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)ycy_dateByAddingDays:(NSUInteger)days;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)ycy_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)ycy_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)ycy_stringWithFormat:(NSString *)format;
+ (NSDate *)ycy_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)ycy_daysInMonth:(NSUInteger)month;
+ (NSUInteger)ycy_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)ycy_daysInMonth;
+ (NSUInteger)ycy_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)ycy_timeInfo;
+ (NSString *)ycy_timeInfoWithDate:(NSDate *)date;
+ (NSString *)ycy_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)ycy_ymdFormat;
- (NSString *)ycy_hmsFormat;
- (NSString *)ycy_ymdHmsFormat;
+ (NSString *)ycy_ymdFormat;
+ (NSString *)ycy_hmsFormat;
+ (NSString *)ycy_ymdHmsFormat;

@end
