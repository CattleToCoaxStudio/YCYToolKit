//
//  NSDate+YCYZeroDate.m
//  Jakey
//
//  Created by Jakey on 15/5/9.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//

#import "NSDate+YCYZeroDate.h"

@implementation NSDate (YCYZeroDate)
+ (NSDate *)ycy_zeroTodayDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:[NSDate date]];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [calendar dateFromComponents:components];
}

+ (NSDate *)ycy_zero24TodayDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:[NSDate date]];
    components.hour = 23;
    components.minute = 59;
    components.second = 0;
    return [calendar dateFromComponents:components];
}

- (NSDate *)ycy_zeroDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [calendar dateFromComponents:components];
}
- (NSDate *)ycy_zero24Date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:self];
    components.hour = 23;
    components.minute = 59;
    components.second = 0;
    return [calendar dateFromComponents:components];
}
@end
