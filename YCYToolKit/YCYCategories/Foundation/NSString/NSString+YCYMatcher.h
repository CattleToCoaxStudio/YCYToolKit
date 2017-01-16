//
//  NSString+YCYMatcher.h
//  Whyd
//
//  Created by Damien Romito on 29/01/15.
//  Copyright (c) 2015 Damien Romito. All rights reserved.
//
//https://github.com/damienromito/NSString-Matcher
#import <Foundation/Foundation.h>
@interface NSString(YCYMatcher)
- (NSArray *)ycy_matchWithRegex:(NSString *)regex;
- (NSString *)ycy_matchWithRegex:(NSString *)regex atIndex:(NSUInteger)index;
- (NSString *)ycy_firstMatchedGroupWithRegex:(NSString *)regex;
- (NSTextCheckingResult *)ycy_firstMatchedResultWithRegex:(NSString *)regex;
@end
