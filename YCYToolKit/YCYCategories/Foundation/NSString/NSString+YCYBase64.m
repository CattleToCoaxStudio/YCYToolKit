//
//  NSString+YCYBase64.m
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSString+YCYBase64.h"
#import "NSData+YCYBase64.h"

@implementation NSString (Base64)
+ (NSString *)ycy_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData ycy_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}
- (NSString *)ycy_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data ycy_base64EncodedStringWithWrapWidth:wrapWidth];
}
- (NSString *)ycy_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data ycy_base64EncodedString];
}
- (NSString *)ycy_base64DecodedString
{
    return [NSString ycy_stringWithBase64EncodedString:self];
}
- (NSData *)ycy_base64DecodedData
{
    return [NSData ycy_dataWithBase64EncodedString:self];
}
@end
