//
//  UIButton+MiddleAligning.h
//  UIButton+MiddleAligning
//
//  Created by Barry on 12/11/15.
//  Copyright © 2015 BarryLee. All rights reserved.
//
// An UIButton category for middle aligning imageView and titleLabel 
//https://github.com/hcbarry/MiddleAlignedButton

#import <UIKit/UIKit.h>

@interface UIButton (YCYMiddleAligning)


/**
 设置间隔

 @param spacing spacing * 2px
 */
- (void)ycy_middleAlignButtonWithSpacing:(CGFloat)spacing;

@end
