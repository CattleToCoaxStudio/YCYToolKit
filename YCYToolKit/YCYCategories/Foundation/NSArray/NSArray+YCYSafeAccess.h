//
//  NSArray+YCYSafeAccess.h
//
//  Created by Jakey on 15/2/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (YCYSafeAccess)
-(id)ycy_objectWithIndex:(NSUInteger)index;

- (NSString*)ycy_stringWithIndex:(NSUInteger)index;

- (NSNumber*)ycy_numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)ycy_decimalNumberWithIndex:(NSUInteger)index;

- (NSArray*)ycy_arrayWithIndex:(NSUInteger)index;

- (NSDictionary*)ycy_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)ycy_integerWithIndex:(NSUInteger)index;

- (NSUInteger)ycy_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)ycy_boolWithIndex:(NSUInteger)index;

- (int16_t)ycy_int16WithIndex:(NSUInteger)index;

- (int32_t)ycy_int32WithIndex:(NSUInteger)index;

- (int64_t)ycy_int64WithIndex:(NSUInteger)index;

- (char)ycy_charWithIndex:(NSUInteger)index;

- (short)ycy_shortWithIndex:(NSUInteger)index;

- (float)ycy_floatWithIndex:(NSUInteger)index;

- (double)ycy_doubleWithIndex:(NSUInteger)index;

- (NSDate *)ycy_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)ycy_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)ycy_pointWithIndex:(NSUInteger)index;

- (CGSize)ycy_sizeWithIndex:(NSUInteger)index;

- (CGRect)ycy_rectWithIndex:(NSUInteger)index;
@end


#pragma --mark NSMutableArray setter

@interface NSMutableArray(YCYSafeAccess)

-(void)ycy_addObj:(id)i;

-(void)ycy_addString:(NSString*)i;

-(void)ycy_addBool:(BOOL)i;

-(void)ycy_addInt:(int)i;

-(void)ycy_addInteger:(NSInteger)i;

-(void)ycy_addUnsignedInteger:(NSUInteger)i;

-(void)ycy_addCGFloat:(CGFloat)f;

-(void)ycy_addChar:(char)c;

-(void)ycy_addFloat:(float)i;

-(void)ycy_addPoint:(CGPoint)o;

-(void)ycy_addSize:(CGSize)o;

-(void)ycy_addRect:(CGRect)o;
@end
