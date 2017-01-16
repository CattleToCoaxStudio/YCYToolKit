//
//  NSString+YCYScore.h
//
//  Created by Nicholas Bruning on 5/12/11.
//  Copyright (c) 2011 Involved Pty Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, NSStringYCYScoreOption) {
    NSStringYCYScoreOptionNone = 1 << 0,
    NSStringYCYScoreOptionFavorSmallerWords = 1 << 1,
    NSStringYCYScoreOptionReducedLongStringPenalty = 1 << 2
};

//模糊匹配字符串 查找某两个字符串的相似程度
@interface NSString (YCYScore)

- (CGFloat)ycy_scoreAgainst:(NSString *)otherString;
- (CGFloat)ycy_scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness;
- (CGFloat)ycy_scoreAgainst:(NSString *)otherString fuzziness:(NSNumber *)fuzziness options:(NSStringYCYScoreOption)options;

@end
