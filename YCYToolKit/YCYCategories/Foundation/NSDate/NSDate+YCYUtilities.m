/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook 3.x and beyond
 BSD License, Use at your own risk
 */

/*
 #import <humor.h> : Not planning to implement: dateByAskingBoyOut and dateByGettingBabysitter
 ----
 General Thanks: sstreza, Scott Lawrence, Kevin Ballard, NoOneButMe, Avi`, August Joki. Lily Vulcano, jcromartiej, Blagovest Dachev, Matthias Plappert,  Slava Bushtruk, Ali Servet Donmez, Ricardo1980, pip8786, Danny Thuerin, Dennis Madsen
 
 Include GMT and time zone utilities?
 */

#import "NSDate+YCYUtilities.h"
#import <UIKit/UIKit.h>
// Thanks, AshFurrow
//static const unsigned ycy_NSDATE_UTILITIES_COMPONENT_FLAGS = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit);

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#define YCY_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({ \
     unsigned components;\
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){ \
        components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
    }else{ \
        components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
    } \
    components; \
})\
_Pragma("clang diagnostic pop") \

#else
#define YCY_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({\
     unsigned components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
    components; \
})\
_Pragma("clang diagnostic pop") \

#endif

@implementation NSDate (Utilities)

// Courtesy of Lukasz Margielewski
// Updated via Holger Haenisch
+ (NSCalendar *) ycy_currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

#pragma mark - Relative Dates

+ (NSDate *)ycy_dateWithDaysFromNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] ycy_dateByAddingDays:days];
}

+ (NSDate *)ycy_dateWithDaysBeforeNow: (NSInteger) days
{
    // Thanks, Jim Morrison
    return [[NSDate date] ycy_dateBySubtractingDays:days];
}

+ (NSDate *) ycy_dateTomorrow
{
    return [NSDate ycy_dateWithDaysFromNow:1];
}

+ (NSDate *) ycy_dateYesterday
{
    return [NSDate ycy_dateWithDaysBeforeNow:1];
}

+ (NSDate *) ycy_dateWithHoursFromNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YCY_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) ycy_dateWithHoursBeforeNow: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - YCY_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) ycy_dateWithMinutesFromNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YCY_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *) ycy_dateWithMinutesBeforeNow: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - YCY_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - String Properties
- (NSString *) ycy_stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *) ycy_stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    return [formatter stringFromDate:self];
}

- (NSString *) ycy_shortString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) ycy_shortTimeString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) ycy_shortDateString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) ycy_mediumString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) ycy_mediumTimeString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) ycy_mediumDateString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) ycy_longString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) ycy_longTimeString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) ycy_longDateString
{
    return [self ycy_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - Comparing Dates

- (BOOL) ycy_isEqualToDateIgnoringTime: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL) ycy_ycy_isToday
{
    return [self ycy_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL) ycy_isTomorrow
{
    return [self ycy_isEqualToDateIgnoringTime:[NSDate ycy_dateTomorrow]];
}

- (BOOL) ycy_isYesterday
{
    return [self ycy_isEqualToDateIgnoringTime:[NSDate ycy_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL)ycy_isSameWeekAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];

    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.week != components2.week) return NO;
    
    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < YCY_D_WEEK);

}

- (BOOL) ycy_isThisWeek
{
    return [self ycy_isSameWeekAsDate:[NSDate date]];
}

- (BOOL) ycy_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YCY_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ycy_isSameWeekAsDate:newDate];
}

- (BOOL) ycy_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - YCY_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self ycy_isSameWeekAsDate:newDate];
}

// Thanks, mspasov
- (BOOL) ycy_isSameMonthAsDate: (NSDate *) aDate
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL) ycy_isThisMonth
{
    return [self ycy_isSameMonthAsDate:[NSDate date]];
}

// Thanks Marcin Krzyzanowski, also for adding/subtracting years and months
- (BOOL) ycy_isLastMonth
{
    return [self ycy_isSameMonthAsDate:[[NSDate date] ycy_dateBySubtractingMonths:1]];
}

- (BOOL) ycy_isNextMonth
{
    return [self ycy_isSameMonthAsDate:[[NSDate date] ycy_dateByAddingMonths:1]];
}

- (BOOL) ycy_isSameYearAsDate: (NSDate *) aDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit  fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    return (components1.year == components2.year);
}

- (BOOL) ycy_isThisYear
{
    // Thanks, baspellis
    return [self ycy_isSameYearAsDate:[NSDate date]];
}

- (BOOL) ycy_isNextYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    
    return (components1.year == (components2.year + 1));
}

- (BOOL) ycy_isLastYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    return (components1.year == (components2.year - 1));
}

- (BOOL) ycy_isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) ycy_isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

// Thanks, markrickert
- (BOOL) ycy_isInFuture
{
    return ([self ycy_isLaterThanDate:[NSDate date]]);
}

// Thanks, markrickert
- (BOOL) ycy_isInPast
{
    return ([self ycy_isEarlierThanDate:[NSDate date]]);
}


#pragma mark - Roles
- (BOOL) ycy_isTypicallyWeekend
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate ycy_currentCalendar] components:NSCalendarUnitWeekday | NSCalendarUnitMonth fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate ycy_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#endif
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL) ycy_isTypicallyWorkday
{
    return ![self ycy_isTypicallyWeekend];
}

#pragma mark - Adjusting Dates

// Thaks, rsjohnson
- (NSDate *) ycy_dateByAddingYears: (NSInteger) dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) ycy_dateBySubtractingYears: (NSInteger) dYears
{
    return [self ycy_dateByAddingYears:-dYears];
}

- (NSDate *) ycy_dateByAddingMonths: (NSInteger) dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) ycy_dateBySubtractingMonths: (NSInteger) dMonths
{
    return [self ycy_dateByAddingMonths:-dMonths];
}

// Courtesy of dedan who mentions issues with Daylight Savings
- (NSDate *) ycy_dateByAddingDays: (NSInteger) dDays
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:dDays];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) ycy_dateBySubtractingDays: (NSInteger) dDays
{
    return [self ycy_dateByAddingDays: (dDays * -1)];
}

- (NSDate *) ycy_dateByAddingHours: (NSInteger) dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + YCY_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) ycy_dateBySubtractingHours: (NSInteger) dHours
{
    return [self ycy_dateByAddingHours: (dHours * -1)];
}

- (NSDate *) ycy_dateByAddingMinutes: (NSInteger) dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + YCY_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *) ycy_dateBySubtractingMinutes: (NSInteger) dMinutes
{
    return [self ycy_dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *) ycy_componentsWithOffsetFromDate: (NSDate *) aDate
{
    NSDateComponents *dTime = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - Extremes

- (NSDate *) ycy_dateAtStartOfDay
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [[NSDate ycy_currentCalendar] dateFromComponents:components];
}

// Thanks gsempe & mteece
- (NSDate *) ycy_dateAtEndOfDay
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];

    components.hour = 23; // Thanks Aleksey Kononov
    components.minute = 59;
    components.second = 59;
    return [[NSDate ycy_currentCalendar] dateFromComponents:components];
}

#pragma mark - Retrieving Intervals

- (NSInteger) ycy_minutesAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / YCY_D_MINUTE);
}

- (NSInteger) ycy_minutesBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / YCY_D_MINUTE);
}

- (NSInteger) ycy_hoursAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / YCY_D_HOUR);
}

- (NSInteger) ycy_hoursBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / YCY_D_HOUR);
}

- (NSInteger) ycy_daysAfterDate: (NSDate *) aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / YCY_D_DAY);
}

- (NSInteger) ycy_daysBeforeDate: (NSDate *) aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / YCY_D_DAY);
}

// Thanks, dmitrydims
// I have not yet thoroughly tested this
- (NSInteger)ycy_distanceDaysToDate:(NSDate *)anotherDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate ycy_currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate ycy_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    
    return components.day;
}
- (NSInteger)ycy_distanceMonthsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate ycy_currentCalendar] components:NSCalendarUnitMonth fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate ycy_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.month;
}
- (NSInteger)ycy_distanceYearsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate ycy_currentCalendar] components:NSCalendarUnitYear fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.year;
}
#pragma mark Decomposing Dates
- (NSInteger)ycy_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + YCY_D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate ycy_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate ycy_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components =  [[NSDate ycy_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#endif
    return components.hour;
}
- (NSInteger) ycy_hour
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.hour;
}

- (NSInteger) ycy_minute
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.minute;
}

- (NSInteger) ycy_seconds
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.second;
}

- (NSInteger) ycy_day
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.day;
}

- (NSInteger) ycy_month
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.month;
}

- (NSInteger) ycy_week
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekOfMonth;
}

- (NSInteger) ycy_weekday
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekday;
}

- (NSInteger) ycy_nthWeekday // e.g. 2nd Tuesday of the month is 2
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.weekdayOrdinal;
}

- (NSInteger) ycy_year
{
    NSDateComponents *components = [[NSDate ycy_currentCalendar] components:YCY_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    return components.year;
}
@end
