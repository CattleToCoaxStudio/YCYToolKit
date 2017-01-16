//
// NSDate+Reporting.h
//
// Created by Mel Sampat on 5/11/12.
// Copyright (c) 2012 Mel Sampat.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSDate (YCYReporting)

// Return a date with a specified year, month and day.
+ (NSDate *)ycy_dateWithYear:(int)year month:(int)month day:(int)day;

// Return midnight on the specified date.
+ (NSDate *)ycy_midnightOfDate:(NSDate *)date;

// Return midnight today.
+ (NSDate *)ycy_midnightToday;

// Return midnight tomorrow.
+ (NSDate *)ycy_midnightTomorrow;

// Returns a date that is exactly 1 day after the specified date. Does *not*
// zero out the time components. For example, if the specified date is
// April 15 2012 10:00 AM, the return value will be April 16 2012 10:00 AM.
+ (NSDate *)ycy_oneDayAfter:(NSDate *)date;

// Returns midnight of the first day of the current, previous or next Month.
// Note: firstDayOfNextMonth returns midnight of the first day of next month,
// which is effectively the same as the "last moment" of the current month.
+ (NSDate *)ycy_firstDayOfCurrentMonth;
+ (NSDate *)ycy_firstDayOfPreviousMonth;
+ (NSDate *)ycy_firstDayOfNextMonth;

// Returns midnight of the first day of the current, previous or next Quarter.
// Note: firstDayOfNextQuarter returns midnight of the first day of next quarter,
// which is effectively the same as the "last moment" of the current quarter.
+ (NSDate *)ycy_firstDayOfCurrentQuarter;
+ (NSDate *)ycy_firstDayOfPreviousQuarter;
+ (NSDate *)ycy_firstDayOfNextQuarter;

// Returns midnight of the first day of the current, previous or next Year.
// Note: firstDayOfNextYear returns midnight of the first day of next year,
// which is effectively the same as the "last moment" of the current year.
+ (NSDate *)ycy_firstDayOfCurrentYear;
+ (NSDate *)ycy_firstDayOfPreviousYear;
+ (NSDate *)ycy_firstDayOfNextYear;


- (NSDate *)ycy_dateFloor;
- (NSDate *)ycy_dateCeil;

- (NSDate *)ycy_startOfWeek;
- (NSDate *)ycy_endOfWeek;

- (NSDate *)ycy_startOfMonth;
- (NSDate *)ycy_endOfMonth;

- (NSDate *)ycy_startOfYear;
- (NSDate *)ycy_endOfYear;

- (NSDate *)ycy_previousDay;
- (NSDate *)ycy_nextDay;

- (NSDate *)ycy_previousWeek;
- (NSDate *)ycy_nextWeek;

- (NSDate *)ycy_previousMonth;
- (NSDate *)ycy_previousMonth:(NSUInteger) monthsToMove;
- (NSDate *)ycy_nextMonth;
- (NSDate *)ycy_nextMonth:(NSUInteger) monthsToMove;

#ifdef DEBUG
// For testing only. A helper function to format and display a date
// with an optional comment. For example:
//     NSDate *test = [NSDate firstDayOfCurrentMonth];
//     [test logWithComment:@"First day of current month: "];
- (void)ycy_logWithComment:(NSString *)comment;
#endif

@end
