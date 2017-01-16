//
//  NSUserDefaults+YCYSafeAccess.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (YCYSafeAccess)

+ (NSString *)ycy_stringForKey:(NSString *)defaultName;

+ (NSArray *)ycy_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)ycy_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)ycy_dataForKey:(NSString *)defaultName;

+ (NSArray *)ycy_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)ycy_integerForKey:(NSString *)defaultName;

+ (float)ycy_floatForKey:(NSString *)defaultName;

+ (double)ycy_doubleForKey:(NSString *)defaultName;

+ (BOOL)ycy_boolForKey:(NSString *)defaultName;

+ (NSURL *)ycy_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)ycy_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)ycy_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)ycy_setArcObject:(id)value forKey:(NSString *)defaultName;

@end
