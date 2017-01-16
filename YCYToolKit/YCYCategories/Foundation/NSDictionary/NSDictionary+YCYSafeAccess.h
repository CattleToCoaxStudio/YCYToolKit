//
//  NSDictionary+YCYSafeAccess.h
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (YCYSafeAccess)
- (BOOL)ycy_hasKey:(NSString *)key;

- (NSString*)ycy_stringForKey:(id)key;

- (NSNumber*)ycy_numberForKey:(id)key;

- (NSDecimalNumber *)ycy_decimalNumberForKey:(id)key;

- (NSArray*)ycy_arrayForKey:(id)key;

- (NSDictionary*)ycy_dictionaryForKey:(id)key;

- (NSInteger)ycy_integerForKey:(id)key;

- (NSUInteger)ycy_unsignedIntegerForKey:(id)key;

- (BOOL)ycy_boolForKey:(id)key;

- (int16_t)ycy_int16ForKey:(id)key;

- (int32_t)ycy_int32ForKey:(id)key;

- (int64_t)ycy_int64ForKey:(id)key;

- (char)ycy_charForKey:(id)key;

- (short)ycy_shortForKey:(id)key;

- (float)ycy_floatForKey:(id)key;

- (double)ycy_doubleForKey:(id)key;

- (long long)ycy_longLongForKey:(id)key;

- (unsigned long long)ycy_unsignedLongLongForKey:(id)key;

- (NSDate *)ycy_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)ycy_CGFloatForKey:(id)key;

- (CGPoint)ycy_pointForKey:(id)key;

- (CGSize)ycy_sizeForKey:(id)key;

- (CGRect)ycy_rectForKey:(id)key;
@end

#pragma --mark NSMutableDictionary setter

@interface NSMutableDictionary(SafeAccess)

-(void)ycy_setObj:(id)i forKey:(NSString*)key;

-(void)ycy_setString:(NSString*)i forKey:(NSString*)key;

-(void)ycy_setBool:(BOOL)i forKey:(NSString*)key;

-(void)ycy_setInt:(int)i forKey:(NSString*)key;

-(void)ycy_setInteger:(NSInteger)i forKey:(NSString*)key;

-(void)ycy_setUnsignedInteger:(NSUInteger)i forKey:(NSString*)key;

-(void)ycy_setCGFloat:(CGFloat)f forKey:(NSString*)key;

-(void)ycy_setChar:(char)c forKey:(NSString*)key;

-(void)ycy_setFloat:(float)i forKey:(NSString*)key;

-(void)ycy_setDouble:(double)i forKey:(NSString*)key;

-(void)ycy_setLongLong:(long long)i forKey:(NSString*)key;

-(void)ycy_setPoint:(CGPoint)o forKey:(NSString*)key;

-(void)ycy_setSize:(CGSize)o forKey:(NSString*)key;

-(void)ycy_setRect:(CGRect)o forKey:(NSString*)key;
@end
