//
//  NSString+YCYUUID.m
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSString+YCYUUID.h"
#import <UIKit/UIKit.h>
@implementation NSString (YCYUUID)
/**
 *  @brief  获取随机 UUID 例如 E621E1F8-C36C-495A-93FC-0C247A3E6E5F
 *
 *  @return 随机 UUID
 */
+ (NSString *)ycy_UUID
{
    if([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0)
    {
       return  [[NSUUID UUID] UUIDString];
    }
    else
    {
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
        CFRelease(uuidRef);
        return (__bridge_transfer NSString *)uuid;
    }
}
/**
 *
 *  @brief  毫秒时间戳 例如 1443066826371
 *
 *  @return 毫秒时间戳
 */
+ (NSString *)ycy_UUIDTimestamp
{
    return  [[NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]*1000] stringValue];
}

@end
