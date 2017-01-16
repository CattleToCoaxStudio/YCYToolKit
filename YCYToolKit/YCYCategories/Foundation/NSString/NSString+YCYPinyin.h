//
//  NSString+YCYPinyin.h
//  Snowball
//
//  Created by croath on 11/11/13.
//  Copyright (c) 2013 Snowball. All rights reserved.
//
// https://github.com/croath/NSString-Pinyin
//  the Chinese Pinyin string of the nsstring

#import <Foundation/Foundation.h>

@interface NSString (YCYPinyin)

- (NSString*)ycy_pinyinWithPhoneticSymbol;
- (NSString*)ycy_pinyin;
- (NSArray*)ycy_pinyinArray;
- (NSString*)ycy_pinyinWithoutBlank;
- (NSArray*)ycy_pinyinInitialsArray;
- (NSString*)ycy_pinyinInitialsString;

@end
