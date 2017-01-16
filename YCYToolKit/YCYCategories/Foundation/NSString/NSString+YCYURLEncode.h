//
//  NSString+UrlEncode.h
//
//  Created by yangchengyou on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (YCYURLEncode)
/**
 *  @brief  urlEncode
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)ycy_urlEncode;
/**
 *  @brief  urlEncode
 *
 *  @param encoding encoding模式
 *
 *  @return urlEncode 后的字符串
 */
- (NSString *)ycy_urlEncodeUsingEncoding:(NSStringEncoding)encoding;
/**
 *  @brief  urlDecode
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)ycy_urlDecode;
/**
 *  @brief  urlDecode
 *
 *  @param encoding encoding模式
 *
 *  @return urlDecode 后的字符串
 */
- (NSString *)ycy_urlDecodeUsingEncoding:(NSStringEncoding)encoding;

/**
 *  @brief  url query转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)ycy_dictionaryFromURLParameters;

@end
