//
//  NSDate+Extension.m
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/632840804/HYBNSDateExtension

#import "NSDate+YCYExtension.h"

@implementation NSDate (YCYExtension)

- (NSUInteger)ycy_day {
    return [NSDate ycy_day:self];
}

- (NSUInteger)ycy_month {
    return [NSDate ycy_month:self];
}

- (NSUInteger)ycy_year {
    return [NSDate ycy_year:self];
}

- (NSUInteger)ycy_hour {
    return [NSDate ycy_hour:self];
}

- (NSUInteger)ycy_minute {
    return [NSDate ycy_minute:self];
}

- (NSUInteger)ycy_second {
    return [NSDate ycy_second:self];
}

+ (NSUInteger)ycy_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
}

+ (NSUInteger)ycy_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)ycy_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)ycy_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)ycy_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)ycy_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents second];
}

- (NSUInteger)ycy_daysInYear {
    return [NSDate ycy_daysInYear:self];
}

+ (NSUInteger)ycy_daysInYear:(NSDate *)date {
    return [self ycy_isLeapYear:date] ? 366 : 365;
}

- (BOOL)ycy_isLeapYear {
    return [NSDate ycy_isLeapYear:self];
}

+ (BOOL)ycy_isLeapYear:(NSDate *)date {
    NSUInteger year = [date ycy_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)ycy_formatYMD {
    return [NSDate ycy_formatYMD:self];
}

+ (NSString *)ycy_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%lu-%02lu-%02lu",[date ycy_year],[date ycy_month], [date ycy_day]];
}

- (NSUInteger)ycy_weeksOfMonth {
    return [NSDate ycy_weeksOfMonth:self];
}

+ (NSUInteger)ycy_weeksOfMonth:(NSDate *)date {
    return [[date ycy_lastdayOfMonth] ycy_weekOfYear] - [[date ycy_begindayOfMonth] ycy_weekOfYear] + 1;
}

- (NSUInteger)ycy_weekOfYear {
    return [NSDate ycy_weekOfYear:self];
}

+ (NSUInteger)ycy_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date ycy_year];
    
    NSDate *lastdate = [date ycy_lastdayOfMonth];
    
    for (i = 1;[[lastdate ycy_dateAfterDay:-7 * i] ycy_year] == year; i++) {
        
    }
    
    return i;
}

- (NSDate *)ycy_dateAfterDay:(NSUInteger)day {
    return [NSDate ycy_dateAfterDate:self day:day];
}

+ (NSDate *)ycy_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)ycy_dateAfterMonth:(NSUInteger)month {
    return [NSDate ycy_dateAfterDate:self month:month];
}

+ (NSDate *)ycy_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)ycy_begindayOfMonth {
    return [NSDate ycy_begindayOfMonth:self];
}

+ (NSDate *)ycy_begindayOfMonth:(NSDate *)date {
    return [self ycy_dateAfterDate:date day:-[date ycy_day] + 1];
}

- (NSDate *)ycy_lastdayOfMonth {
    return [NSDate ycy_lastdayOfMonth:self];
}

+ (NSDate *)ycy_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self ycy_begindayOfMonth:date];
    return [[lastDate ycy_dateAfterMonth:1] ycy_dateAfterDay:-1];
}

- (NSUInteger)ycy_daysAgo {
    return [NSDate ycy_daysAgo:self];
}

+ (NSUInteger)ycy_daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];
}

- (NSInteger)ycy_weekday {
    return [NSDate ycy_weekday:self];
}

+ (NSInteger)ycy_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)ycy_dayFromWeekday {
    return [NSDate ycy_dayFromWeekday:self];
}

+ (NSString *)ycy_dayFromWeekday:(NSDate *)date {
    switch([date ycy_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)ycy_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

- (BOOL)ycy_isToday {
    return [self ycy_isSameDay:[NSDate date]];
}

- (NSDate *)ycy_dateByAddingDays:(NSUInteger)days {
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

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
+ (NSString *)ycy_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)ycy_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date ycy_stringWithFormat:format];
}

- (NSString *)ycy_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)ycy_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSUInteger)ycy_daysInMonth:(NSUInteger)month {
    return [NSDate ycy_daysInMonth:self month:month];
}

+ (NSUInteger)ycy_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date ycy_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)ycy_daysInMonth {
    return [NSDate ycy_daysInMonth:self];
}

+ (NSUInteger)ycy_daysInMonth:(NSDate *)date {
    return [self ycy_daysInMonth:date month:[date ycy_month]];
}

- (NSString *)ycy_timeInfo {
    return [NSDate ycy_timeInfoWithDate:self];
}

+ (NSString *)ycy_timeInfoWithDate:(NSDate *)date {
    return [self ycy_timeInfoWithDateString:[self ycy_stringWithDate:date format:[self ycy_ymdHmsFormat]]];
}

+ (NSString *)ycy_timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self ycy_dateWithString:dateString format:[self ycy_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate ycy_month] - [date ycy_month]);
    int year = (int)([curDate ycy_year] - [date ycy_year]);
    int day = (int)([curDate ycy_day] - [date ycy_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate ycy_month] == 1 && [date ycy_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self ycy_daysInMonth:date month:[date ycy_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate ycy_day] + (totalDays - (int)[date ycy_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate ycy_month];
            int preMonth = (int)[date ycy_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)ycy_ymdFormat {
    return [NSDate ycy_ymdFormat];
}

- (NSString *)ycy_hmsFormat {
    return [NSDate ycy_hmsFormat];
}

- (NSString *)ycy_ymdHmsFormat {
    return [NSDate ycy_ymdHmsFormat];
}

+ (NSString *)ycy_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)ycy_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)ycy_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self ycy_ymdFormat], [self ycy_hmsFormat]];
}

- (NSDate *)ycy_offsetYears:(int)numYears {
    return [NSDate ycy_offsetYears:numYears fromDate:self];
}

+ (NSDate *)ycy_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)ycy_offsetMonths:(int)numMonths {
    return [NSDate ycy_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)ycy_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)ycy_offsetDays:(int)numDays {
    return [NSDate ycy_offsetDays:numDays fromDate:self];
}

+ (NSDate *)ycy_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)ycy_offsetHours:(int)hours {
    return [NSDate ycy_offsetHours:hours fromDate:self];
}

+ (NSDate *)ycy_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}
@end
