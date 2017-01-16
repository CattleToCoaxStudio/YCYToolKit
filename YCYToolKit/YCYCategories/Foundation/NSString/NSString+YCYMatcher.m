//  NSString+YCYMatcher.m
//  Whyd
//
//  Created by Damien Romito on 29/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//

#import "NSString+YCYMatcher.h"

@implementation NSString(YCYMatcher)


- (NSArray *)ycy_matchWithRegex:(NSString *)regex
{
    NSTextCheckingResult *result = [self ycy_firstMatchedResultWithRegex:regex];
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:[result numberOfRanges]];
    for (int i = 0 ; i < [result numberOfRanges]; i ++ ) {
        [mArray addObject:[self substringWithRange:[result rangeAtIndex:i]]];
    }
    return mArray;
}


- (NSString *)ycy_matchWithRegex:(NSString *)regex atIndex:(NSUInteger)index
{
    NSTextCheckingResult *result = [self ycy_firstMatchedResultWithRegex:regex];
    return [self substringWithRange:[result rangeAtIndex:index]];
}


- (NSString *)ycy_firstMatchedGroupWithRegex:(NSString *)regex
{
    NSTextCheckingResult *result = [self ycy_firstMatchedResultWithRegex:regex];
    return [self substringWithRange:[result rangeAtIndex:1]];
}


- (NSTextCheckingResult *)ycy_firstMatchedResultWithRegex:(NSString *)regex
{
    NSRegularExpression *regexExpression = [NSRegularExpression regularExpressionWithPattern:regex options:(NSRegularExpressionOptions)0 error:NULL];
    NSRange range = {0, self.length};
    return [regexExpression firstMatchInString:self options:(NSMatchingOptions)0 range:range];
}

@end
