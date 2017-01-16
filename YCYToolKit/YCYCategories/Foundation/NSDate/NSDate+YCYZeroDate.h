//
//  NSDate+YCYZeroDate.h
//  Jakey
//
//  Created by Jakey on 15/5/9.
//  Copyright (c) 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YCYZeroDate)
+ (NSDate *)ycy_zeroTodayDate;
+ (NSDate *)ycy_zero24TodayDate;

- (NSDate *)ycy_zeroDate;
- (NSDate *)ycy_zero24Date;
@end
