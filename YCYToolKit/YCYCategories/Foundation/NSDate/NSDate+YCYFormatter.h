//
//  NSDate+Formatter.h
//
//  Copyright (C) 2013 by Christopher Meyer
//  http://schwiiz.org/
//

#import <Foundation/Foundation.h>

@interface NSDate (YCYFormatter)

+(NSDateFormatter *)ycy_formatter;
+(NSDateFormatter *)ycy_formatterWithoutTime;
+(NSDateFormatter *)ycy_formatterWithoutDate;

-(NSString *)ycy_formatWithUTCTimeZone;
-(NSString *)ycy_formatWithLocalTimeZone;
-(NSString *)ycy_formatWithTimeZoneOffset:(NSTimeInterval)offset;
-(NSString *)ycy_formatWithTimeZone:(NSTimeZone *)timezone;

-(NSString *)ycy_formatWithUTCTimeZoneWithoutTime;
-(NSString *)ycy_formatWithLocalTimeZoneWithoutTime;
-(NSString *)ycy_formatWithTimeZoneOffsetWithoutTime:(NSTimeInterval)offset;
-(NSString *)ycy_formatWithTimeZoneWithoutTime:(NSTimeZone *)timezone;

-(NSString *)ycy_formatWithUTCWithoutDate;
-(NSString *)ycy_formatWithLocalTimeWithoutDate;
-(NSString *)ycy_formatWithTimeZoneOffsetWithoutDate:(NSTimeInterval)offset;
-(NSString *)ycy_formatTimeWithTimeZone:(NSTimeZone *)timezone;


+ (NSString *)ycy_currentDateStringWithFormat:(NSString *)format;
+ (NSDate *)ycy_dateWithSecondsFromNow:(NSInteger)seconds;
+ (NSDate *)ycy_dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSString *)ycy_dateWithFormat:(NSString *)format;
@end
