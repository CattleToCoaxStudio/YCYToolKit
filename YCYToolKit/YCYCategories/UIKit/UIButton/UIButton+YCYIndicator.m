//
//  UIButton+Indicator.m
//  UIButton Indicator
//
//  Copyright (c) 2015 Jeremiah Poisson
//

#import "UIButton+YCYIndicator.h"
#import <objc/runtime.h>

// Associative reference keys.
static NSString *const ycy_IndicatorViewKey = @"indicatorView";
static NSString *const ycy_ButtonTextObjectKey = @"buttonTextObject";

@implementation UIButton (YCYIndicator)

- (void)ycy_showIndicator {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    [indicator startAnimating];
    
    NSString *currentButtonText = self.titleLabel.text;
    
    objc_setAssociatedObject(self, &ycy_ButtonTextObjectKey, currentButtonText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &ycy_IndicatorViewKey, indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:@"" forState:UIControlStateNormal];
    self.enabled = NO;
    [self addSubview:indicator];
    
    
}

- (void)ycy_hideIndicator {
    
    NSString *currentButtonText = (NSString *)objc_getAssociatedObject(self, &ycy_ButtonTextObjectKey);
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &ycy_IndicatorViewKey);
    
    [indicator removeFromSuperview];
    [self setTitle:currentButtonText forState:UIControlStateNormal];
    self.enabled = YES;
    
}

@end
