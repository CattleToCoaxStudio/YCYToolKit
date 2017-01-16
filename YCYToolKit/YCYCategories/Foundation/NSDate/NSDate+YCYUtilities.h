//
//  NSDate+Utilities.h
//
//  Copyright (c) 2014年 NULLS All rights reserved.
//
// https://github.com/erica/NSDate-Extensions
#import <Foundation/Foundation.h>
#define YCY_D_MINUTE	60
#define YCY_D_HOUR	3600
#define YCY_D_DAY	86400
#define YCY_D_WEEK	604800
#define YCY_D_YEAR	31556926
@interface NSDate (YCYUtilities)
+ (NSCalendar *)ycy_currentCalendar; // avoid bottlenecks
#pragma mark ---- Decomposing dates 分解的日期
@property (readonly) NSInteger ycy_nearestHour;
@property (readonly) NSInteger ycy_hour;
@property (readonly) NSInteger ycy_minute;
@property (readonly) NSInteger ycy_seconds;
@property (readonly) NSInteger ycy_day;
@property (readonly) NSInteger ycy_month;
@property (readonly) NSInteger ycy_week;
@property (readonly) NSInteger ycy_weekday;
@property (readonly) NSInteger ycy_nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger ycy_year;

#pragma mark ----short time 格式化的时间
@property (nonatomic, readonly) NSString *ycy_shortString;
@property (nonatomic, readonly) NSString *ycy_shortDateString;
@property (nonatomic, readonly) NSString *ycy_shortTimeString;
@property (nonatomic, readonly) NSString *ycy_mediumString;
@property (nonatomic, readonly) NSString *ycy_mediumDateString;
@property (nonatomic, readonly) NSString *ycy_mediumTimeString;
@property (nonatomic, readonly) NSString *ycy_longString;
@property (nonatomic, readonly) NSString *ycy_longDateString;
@property (nonatomic, readonly) NSString *ycy_longTimeString;

///使用dateStyle timeStyle格式化时间
- (NSString *)ycy_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
///给定format格式化时间
- (NSString *)ycy_stringWithFormat:(NSString *)format;

#pragma mark ---- 从当前日期相对日期时间
///明天
+ (NSDate *)ycy_dateTomorrow;
///昨天
+ (NSDate *)ycy_dateYesterday;
///今天后几天
+ (NSDate *)ycy_dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)ycy_dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)ycy_dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)ycy_dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)ycy_dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)ycy_dateWithMinutesBeforeNow:(NSInteger)dMinutes;


#pragma mark ---- Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)ycy_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)ycy_isToday;
///是否是明天
- (BOOL)ycy_isTomorrow;
///是否是昨天
- (BOOL)ycy_isYesterday;

///是否是同一周
- (BOOL)ycy_isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)ycy_isThisWeek;
///是否是本周的下周
- (BOOL)ycy_isNextWeek;
///是否是本周的上周
- (BOOL)ycy_isLastWeek;

///是否是同一月
- (BOOL)ycy_isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)ycy_isThisMonth;
///是否是本月的下月
- (BOOL)ycy_isNextMonth;
///是否是本月的上月
- (BOOL)ycy_isLastMonth;

///是否是同一年
- (BOOL)ycy_isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)ycy_isThisYear;
///是否是今年的下一年
- (BOOL)ycy_isNextYear;
///是否是今年的上一年
- (BOOL)ycy_isLastYear;

///是否提前aDate
- (BOOL)ycy_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)ycy_isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)ycy_isInFuture;
///是否晚是过去
- (BOOL)ycy_isInPast;


///是否是工作日
- (BOOL)ycy_isTypicallyWorkday;
///是否是周末
- (BOOL)ycy_isTypicallyWeekend;

#pragma mark ---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)ycy_dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)ycy_dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)ycy_dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)ycy_dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)ycy_dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)ycy_dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)ycy_dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)ycy_dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)ycy_dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)ycy_dateBySubtractingMinutes:(NSInteger)dMinutes;


#pragma mark ---- 时间间隔
///比aDate晚多少分钟
- (NSInteger)ycy_minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)ycy_minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)ycy_hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)ycy_hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)ycy_daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)ycy_daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)ycy_distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)ycy_distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)ycy_distanceYearsToDate:(NSDate *)anotherDate;
@end
