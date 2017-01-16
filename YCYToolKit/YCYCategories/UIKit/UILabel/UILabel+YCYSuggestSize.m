//
//  UILabel+YCYSuggestSize.m
//  WordPress
//
//  Created by Eric J on 6/18/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import "UILabel+YCYSuggestSize.h"

@implementation UILabel (YCYSuggestSize)

- (CGSize)ycy_suggestedSizeForWidth:(CGFloat)width {
    if (self.attributedText)
        return [self ycy_suggestSizeForAttributedString:self.attributedText width:width];
    
	return [self ycy_suggestSizeForString:self.text width:width];
}

- (CGSize)ycy_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

- (CGSize)ycy_suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [self ycy_suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: self.font}] width:width];
}

@end
