//
//  NSString+UrlEncode.h
//
//  Created by yangchengyou on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//


#import "NSString+YCYURLEncode.h"

@implementation NSString (YCYURLEncode)
/**
 *  @brief  urlEncode
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)ycy_urlEncode {
    return [self ycy_urlEncodeUsingEncoding:NSUTF8StringEncoding];
}
/**
 *  @brief  urlEncode
 *
 *  @param encoding encoding模式
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)ycy_urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                (__bridge CFStringRef)self,NULL,(CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                 CFStringConvertNSStringEncodingToEncoding(encoding));
}
/**
 *  @brief  urlDecode
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)ycy_urlDecode {
    return [self ycy_urlDecodeUsingEncoding:NSUTF8StringEncoding];
}
/**
 *  @brief  urlDecode
 *
 *  @param encoding encoding模式
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)ycy_urlDecodeUsingEncoding:(NSStringEncoding)encoding {
	return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
             (__bridge CFStringRef)self,CFSTR(""),CFStringConvertNSStringEncodingToEncoding(encoding));
}
/**
 *  @brief  url query转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)ycy_dictionaryFromURLParameters
{
    NSArray *pairs = [self componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val = [[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [params setObject:val forKey:[kv objectAtIndex:0]];
    }
    return params;
}

@end
