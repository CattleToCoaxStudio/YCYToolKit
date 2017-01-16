//
//  NSArray+YCYSafeAccess.m
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSArray+YCYSafeAccess.h"

@implementation NSArray (YCYSafeAccess)
-(id)ycy_objectWithIndex:(NSUInteger)index{
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
}

- (NSString*)ycy_stringWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}


- (NSNumber*)ycy_numberWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)ycy_decimalNumberWithIndex:(NSUInteger)index{
    id value = [self ycy_objectWithIndex:index];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray*)ycy_arrayWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}


- (NSDictionary*)ycy_dictionaryWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)ycy_integerWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
- (NSUInteger)ycy_unsignedIntegerWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}
- (BOOL)ycy_boolWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)ycy_int16WithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)ycy_int32WithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)ycy_int64WithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (char)ycy_charWithIndex:(NSUInteger)index{
    
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)ycy_shortWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)ycy_floatWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)ycy_doubleWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (NSDate *)ycy_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self ycy_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

//CG
- (CGFloat)ycy_CGFloatWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    CGFloat f = [value doubleValue];
    
    return f;
}

- (CGPoint)ycy_pointWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];

    CGPoint point = CGPointFromString(value);
    
    return point;
}
- (CGSize)ycy_sizeWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];

    CGSize size = CGSizeFromString(value);
    
    return size;
}
- (CGRect)ycy_rectWithIndex:(NSUInteger)index
{
    id value = [self ycy_objectWithIndex:index];
    
    CGRect rect = CGRectFromString(value);
    
    return rect;
}
@end


#pragma --mark NSMutableArray setter
@implementation NSMutableArray (YCYSafeAccess)
-(void)ycy_addObj:(id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)ycy_addString:(NSString*)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}
-(void)ycy_addBool:(BOOL)i
{
    [self addObject:@(i)];
}
-(void)ycy_addInt:(int)i
{
    [self addObject:@(i)];
}
-(void)ycy_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}
-(void)ycy_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}
-(void)ycy_addCGFloat:(CGFloat)f
{
   [self addObject:@(f)];
}
-(void)ycy_addChar:(char)c
{
    [self addObject:@(c)];
}
-(void)ycy_addFloat:(float)i
{
    [self addObject:@(i)];
}
-(void)ycy_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}
-(void)ycy_addSize:(CGSize)o
{
   [self addObject:NSStringFromCGSize(o)];
}
-(void)ycy_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}
@end

