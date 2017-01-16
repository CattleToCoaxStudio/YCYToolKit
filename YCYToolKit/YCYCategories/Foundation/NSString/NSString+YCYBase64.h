//
//  NSString+YCYBase64.h
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YCYBase64)
+ (NSString *)ycy_stringWithBase64EncodedString:(NSString *)string;
- (NSString *)ycy_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)ycy_base64EncodedString;
- (NSString *)ycy_base64DecodedString;
- (NSData *)ycy_base64DecodedData;
@end
