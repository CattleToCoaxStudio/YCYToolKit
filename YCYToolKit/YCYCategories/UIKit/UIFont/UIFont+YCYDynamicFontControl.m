//
//  UIFont+YCYDynamicFontControl.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIFont+YCYDynamicFontControl.h"

@implementation UIFont (YCYDynamicFontControl)

+(UIFont *)ycy_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName{
    return [UIFont ycy_preferredFontForTextStyle:style withFontName:fontName scale:1.0f];
}

+(UIFont *)ycy_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale{
    
    
    UIFont * font = nil;
    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){
        font = [UIFont preferredFontForTextStyle:fontName];
    }else{
        font = [UIFont fontWithName:fontName size:14 * scale];
    }
    
    
    return [font ycy_adjustFontForTextStyle:style];
    
}

-(UIFont *)ycy_adjustFontForTextStyle:(NSString *)style{
    return [self ycy_adjustFontForTextStyle:style scale:1.0f];
}

-(UIFont *)ycy_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale{
    
    UIFontDescriptor * fontDescriptor = nil;
    
    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){
        
        fontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:style];
        
    }else{
        
        fontDescriptor = self.fontDescriptor;
        
    }
    
    float dynamicSize = [fontDescriptor pointSize] * scale + 3;
    
    return [UIFont fontWithName:self.fontName size:dynamicSize];
    
}

@end
