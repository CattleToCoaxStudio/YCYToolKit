
//
//  UIButton+YCYSubmitting.h
//
//  Created by ycy on 15/4/2.
//  Copyright (c) 2015年 NULLS. All rights reserved.

#import "UIButton+YCYSubmitting.h"
#import  <objc/runtime.h>

@interface UIButton ()

@property(nonatomic, strong) UIView *ycy_modalView;
@property(nonatomic, strong) UIActivityIndicatorView *ycy_spinnerView;
@property(nonatomic, strong) UILabel *ycy_spinnerTitleLabel;

@end

@implementation UIButton (YCYSubmitting)

- (void)ycy_beginSubmitting:(NSString *)title {
    [self ycy_endSubmitting];
    
    self.ycy_submitting = @YES;
    self.hidden = YES;
    
    self.ycy_modalView = [[UIView alloc] initWithFrame:self.frame];
    self.ycy_modalView.backgroundColor =
    [self.backgroundColor colorWithAlphaComponent:0.6];
    self.ycy_modalView.layer.cornerRadius = self.layer.cornerRadius;
    self.ycy_modalView.layer.borderWidth = self.layer.borderWidth;
    self.ycy_modalView.layer.borderColor = self.layer.borderColor;
    
    CGRect viewBounds = self.ycy_modalView.bounds;
    self.ycy_spinnerView = [[UIActivityIndicatorView alloc]
                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.ycy_spinnerView.tintColor = self.titleLabel.textColor;
    
    CGRect spinnerViewBounds = self.ycy_spinnerView.bounds;
    self.ycy_spinnerView.frame = CGRectMake(
                                        15, viewBounds.size.height / 2 - spinnerViewBounds.size.height / 2,
                                        spinnerViewBounds.size.width, spinnerViewBounds.size.height);
    self.ycy_spinnerTitleLabel = [[UILabel alloc] initWithFrame:viewBounds];
    self.ycy_spinnerTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.ycy_spinnerTitleLabel.text = title;
    self.ycy_spinnerTitleLabel.font = self.titleLabel.font;
    self.ycy_spinnerTitleLabel.textColor = self.titleLabel.textColor;
    [self.ycy_modalView addSubview:self.ycy_spinnerView];
    [self.ycy_modalView addSubview:self.ycy_spinnerTitleLabel];
    [self.superview addSubview:self.ycy_modalView];
    [self.ycy_spinnerView startAnimating];
}

- (void)ycy_endSubmitting {
    if (!self.isycySubmitting.boolValue) {
        return;
    }
    
    self.ycy_submitting = @NO;
    self.hidden = NO;
    
    [self.ycy_modalView removeFromSuperview];
    self.ycy_modalView = nil;
    self.ycy_spinnerView = nil;
    self.ycy_spinnerTitleLabel = nil;
}

- (NSNumber *)isycySubmitting {
    return objc_getAssociatedObject(self, @selector(setYcy_submitting:));
}

- (void)setYcy_submitting:(NSNumber *)submitting {
    objc_setAssociatedObject(self, @selector(setYcy_submitting:), submitting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (UIActivityIndicatorView *)ycy_spinnerView {
    return objc_getAssociatedObject(self, @selector(setYcy_spinnerView:));
}

- (void)setYcy_spinnerView:(UIActivityIndicatorView *)spinnerView {
    objc_setAssociatedObject(self, @selector(setYcy_spinnerView:), spinnerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ycy_modalView {
    return objc_getAssociatedObject(self, @selector(setYcy_modalView:));

}

- (void)setycy_modalView:(UIView *)modalView {
    objc_setAssociatedObject(self, @selector(setYcy_modalView:), modalView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)ycy_spinnerTitleLabel {
    return objc_getAssociatedObject(self, @selector(setYcy_spinnerTitleLabel:));
}

- (void)setycy_spinnerTitleLabel:(UILabel *)spinnerTitleLabel {
    objc_setAssociatedObject(self, @selector(setYcy_spinnerTitleLabel:), spinnerTitleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
