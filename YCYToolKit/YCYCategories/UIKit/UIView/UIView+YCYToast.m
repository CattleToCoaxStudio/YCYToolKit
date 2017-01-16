//
//  UIView+Toast.m
//  Toast
//
//  Copyright 2014 Charles Scalesse.
//


#import "UIView+YCYToast.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

/*
 *  CONFIGURE THESE VALUES TO ADJUST LOOK & FEEL,
 *  DISPLAY DURATION, ETC.
 */

// general appearance
static const CGFloat YCYToastMaxWidth            = 0.8;      // 80% of parent view width
static const CGFloat YCYToastMaxHeight           = 0.8;      // 80% of parent view height
static const CGFloat YCYToastHorizontalPadding   = 10.0;
static const CGFloat YCYToastVerticalPadding     = 10.0;
static const CGFloat YCYToastCornerRadius        = 10.0;
static const CGFloat YCYToastOpacity             = 0.8;
static const CGFloat YCYToastFontSize            = 16.0;
static const CGFloat YCYToastMaxTitleLines       = 0;
static const CGFloat YCYToastMaxMessageLines     = 0;
static const NSTimeInterval YCYToastFadeDuration = 0.2;

// shadow appearance
static const CGFloat YCYToastShadowOpacity       = 0.8;
static const CGFloat YCYToastShadowRadius        = 6.0;
static const CGSize  YCYToastShadowOffset        = { 4.0, 4.0 };
static const BOOL    YCYToastDisplayShadow       = YES;

// display duration
static const NSTimeInterval YCYToastDefaultDuration  = 3.0;

// image view size
static const CGFloat YCYToastImageViewWidth      = 80.0;
static const CGFloat YCYToastImageViewHeight     = 80.0;

// activity
static const CGFloat YCYToastActivityWidth       = 100.0;
static const CGFloat YCYToastActivityHeight      = 100.0;
static const NSString * YCYToastActivityDefaultPosition = @"center";

// interaction
static const BOOL YCYToastHidesOnTap             = YES;     // excludes activity views

// associative reference keys
static const NSString * YCYToastTimerKey         = @"YCYToastTimerKey";
static const NSString * YCYToastActivityViewKey  = @"YCYToastActivityViewKey";
static const NSString * YCYToastTapCallbackKey   = @"YCYToastTapCallbackKey";

// positions
NSString * const YCYToastPositionTop             = @"top";
NSString * const YCYToastPositionCenter          = @"center";
NSString * const YCYToastPositionBottom          = @"bottom";

@interface UIView (YCYToastPrivate)

- (void)ycy_hideToast:(UIView *)toast;
- (void)ycy_toastTimerDidFinish:(NSTimer *)timer;
- (void)ycy_handleToastTapped:(UITapGestureRecognizer *)recognizer;
- (CGPoint)ycy_centerPointForPosition:(id)position withToast:(UIView *)toast;
- (UIView *)ycy_viewForMessage:(NSString *)message title:(NSString *)title image:(UIImage *)image;
- (CGSize)ycy_sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end


@implementation UIView (YCYToast)

#pragma mark - Toast Methods

- (void)ycy_makeToast:(NSString *)message {
    [self ycy_makeToast:message duration:YCYToastDefaultDuration position:nil];
}

- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position {
    UIView *toast = [self ycy_viewForMessage:message title:nil image:nil];
    [self ycy_showToast:toast duration:duration position:position];
}

- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position title:(NSString *)title {
    UIView *toast = [self ycy_viewForMessage:message title:title image:nil];
    [self ycy_showToast:toast duration:duration position:position];
}

- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)duration position:(id)position image:(UIImage *)image {
    UIView *toast = [self ycy_viewForMessage:message title:nil image:image];
    [self ycy_showToast:toast duration:duration position:position];
}

- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)duration  position:(id)position title:(NSString *)title image:(UIImage *)image {
    UIView *toast = [self ycy_viewForMessage:message title:title image:image];
    [self ycy_showToast:toast duration:duration position:position];
}

- (void)ycy_showToast:(UIView *)toast {
    [self ycy_showToast:toast duration:YCYToastDefaultDuration position:nil];
}


- (void)ycy_showToast:(UIView *)toast duration:(NSTimeInterval)duration position:(id)position {
    [self ycy_showToast:toast duration:duration position:position tapCallback:nil];
    
}


- (void)ycy_showToast:(UIView *)toast duration:(NSTimeInterval)duration position:(id)position
      tapCallback:(void(^)(void))tapCallback
{
    toast.center = [self ycy_centerPointForPosition:position withToast:toast];
    toast.alpha = 0.0;
    
    if (YCYToastHidesOnTap) {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:toast action:@selector(ycy_handleToastTapped:)];
        [toast addGestureRecognizer:recognizer];
        toast.userInteractionEnabled = YES;
        toast.exclusiveTouch = YES;
    }
    
    [self addSubview:toast];
    
    [UIView animateWithDuration:YCYToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         toast.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(ycy_toastTimerDidFinish:) userInfo:toast repeats:NO];
                         // associate the timer with the toast view
                         objc_setAssociatedObject (toast, &YCYToastTimerKey, timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         objc_setAssociatedObject (toast, &YCYToastTapCallbackKey, tapCallback, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                     }];
}


- (void)ycy_hideToast:(UIView *)toast {
    [UIView animateWithDuration:YCYToastFadeDuration
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         toast.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [toast removeFromSuperview];
                     }];
}

#pragma mark - Events

- (void)ycy_toastTimerDidFinish:(NSTimer *)timer {
    [self ycy_hideToast:(UIView *)timer.userInfo];
}

- (void)ycy_handleToastTapped:(UITapGestureRecognizer *)recognizer {
    NSTimer *timer = (NSTimer *)objc_getAssociatedObject(self, &YCYToastTimerKey);
    [timer invalidate];
    
    void (^callback)(void) = objc_getAssociatedObject(self, &YCYToastTapCallbackKey);
    if (callback) {
        callback();
    }
    [self ycy_hideToast:recognizer.view];
}

#pragma mark - Toast Activity Methods

- (void)ycy_makeToastActivity {
    [self ycy_makeToastActivity:YCYToastActivityDefaultPosition];
}

- (void)ycy_makeToastActivity:(id)position {
    // sanity
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &YCYToastActivityViewKey);
    if (existingActivityView != nil) return;
    
    UIView *activityView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YCYToastActivityWidth, YCYToastActivityHeight)];
    activityView.center = [self ycy_centerPointForPosition:position withToast:activityView];
    activityView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:YCYToastOpacity];
    activityView.alpha = 0.0;
    activityView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    activityView.layer.cornerRadius = YCYToastCornerRadius;
    
    if (YCYToastDisplayShadow) {
        activityView.layer.shadowColor = [UIColor blackColor].CGColor;
        activityView.layer.shadowOpacity = YCYToastShadowOpacity;
        activityView.layer.shadowRadius = YCYToastShadowRadius;
        activityView.layer.shadowOffset = YCYToastShadowOffset;
    }
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.center = CGPointMake(activityView.bounds.size.width / 2, activityView.bounds.size.height / 2);
    [activityView addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    // associate the activity view with self
    objc_setAssociatedObject (self, &YCYToastActivityViewKey, activityView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addSubview:activityView];
    
    [UIView animateWithDuration:YCYToastFadeDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         activityView.alpha = 1.0;
                     } completion:nil];
}

- (void)ycy_hideToastActivity {
    UIView *existingActivityView = (UIView *)objc_getAssociatedObject(self, &YCYToastActivityViewKey);
    if (existingActivityView != nil) {
        [UIView animateWithDuration:YCYToastFadeDuration
                              delay:0.0
                            options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                         animations:^{
                             existingActivityView.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             [existingActivityView removeFromSuperview];
                             objc_setAssociatedObject (self, &YCYToastActivityViewKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         }];
    }
}

#pragma mark - Helpers

- (CGPoint)ycy_centerPointForPosition:(id)point withToast:(UIView *)toast {
    if([point isKindOfClass:[NSString class]]) {
        if([point caseInsensitiveCompare:YCYToastPositionTop] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width/2, (toast.frame.size.height / 2) + YCYToastVerticalPadding);
        } else if([point caseInsensitiveCompare:YCYToastPositionCenter] == NSOrderedSame) {
            return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        }
    } else if ([point isKindOfClass:[NSValue class]]) {
        return [point CGPointValue];
    }
    
    // default to bottom
    return CGPointMake(self.bounds.size.width/2, (self.bounds.size.height - (toast.frame.size.height / 2)) - YCYToastVerticalPadding);
}

- (CGSize)ycy_sizeForString:(NSString *)string font:(UIFont *)font constrainedToSize:(CGSize)constrainedSize lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = lineBreakMode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
        CGRect boundingRect = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        return CGSizeMake(ceilf(boundingRect.size.width), ceilf(boundingRect.size.height));
    }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    return [string sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
}

- (UIView *)ycy_viewForMessage:(NSString *)message title:(NSString *)title image:(UIImage *)image {
    // sanity
    if((message == nil) && (title == nil) && (image == nil)) return nil;

    // dynamically build a toast view with any combination of message, title, & image.
    UILabel *messageLabel = nil;
    UILabel *titleLabel = nil;
    UIImageView *imageView = nil;
    
    // create the parent view
    UIView *wrapperView = [[UIView alloc] init];
    wrapperView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    wrapperView.layer.cornerRadius = YCYToastCornerRadius;
    
    if (YCYToastDisplayShadow) {
        wrapperView.layer.shadowColor = [UIColor blackColor].CGColor;
        wrapperView.layer.shadowOpacity = YCYToastShadowOpacity;
        wrapperView.layer.shadowRadius = YCYToastShadowRadius;
        wrapperView.layer.shadowOffset = YCYToastShadowOffset;
    }

    wrapperView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:YCYToastOpacity];
    
    if(image != nil) {
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(YCYToastHorizontalPadding, YCYToastVerticalPadding, YCYToastImageViewWidth, YCYToastImageViewHeight);
    }
    
    CGFloat imageWidth, imageHeight, imageLeft;
    
    // the imageView frame values will be used to size & position the other views
    if(imageView != nil) {
        imageWidth = imageView.bounds.size.width;
        imageHeight = imageView.bounds.size.height;
        imageLeft = YCYToastHorizontalPadding;
    } else {
        imageWidth = imageHeight = imageLeft = 0.0;
    }
    
    if (title != nil) {
        titleLabel = [[UILabel alloc] init];
        titleLabel.numberOfLines = YCYToastMaxTitleLines;
        titleLabel.font = [UIFont boldSystemFontOfSize:YCYToastFontSize];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.alpha = 1.0;
        titleLabel.text = title;
        
        // size the title label according to the length of the text
        CGSize maxSizeTitle = CGSizeMake((self.bounds.size.width * YCYToastMaxWidth) - imageWidth, self.bounds.size.height * YCYToastMaxHeight);
        CGSize expectedSizeTitle = [self ycy_sizeForString:title font:titleLabel.font constrainedToSize:maxSizeTitle lineBreakMode:titleLabel.lineBreakMode];
        titleLabel.frame = CGRectMake(0.0, 0.0, expectedSizeTitle.width, expectedSizeTitle.height);
    }
    
    if (message != nil) {
        messageLabel = [[UILabel alloc] init];
        messageLabel.numberOfLines = YCYToastMaxMessageLines;
        messageLabel.font = [UIFont systemFontOfSize:YCYToastFontSize];
        messageLabel.lineBreakMode = NSLineBreakByWordWrapping;
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.alpha = 1.0;
        messageLabel.text = message;
        
        // size the message label according to the length of the text
        CGSize maxSizeMessage = CGSizeMake((self.bounds.size.width * YCYToastMaxWidth) - imageWidth, self.bounds.size.height * YCYToastMaxHeight);
        CGSize expectedSizeMessage = [self ycy_sizeForString:message font:messageLabel.font constrainedToSize:maxSizeMessage lineBreakMode:messageLabel.lineBreakMode];
        messageLabel.frame = CGRectMake(0.0, 0.0, expectedSizeMessage.width, expectedSizeMessage.height);
    }
    
    // titleLabel frame values
    CGFloat titleWidth, titleHeight, titleTop, titleLeft;
    
    if(titleLabel != nil) {
        titleWidth = titleLabel.bounds.size.width;
        titleHeight = titleLabel.bounds.size.height;
        titleTop = YCYToastVerticalPadding;
        titleLeft = imageLeft + imageWidth + YCYToastHorizontalPadding;
    } else {
        titleWidth = titleHeight = titleTop = titleLeft = 0.0;
    }
    
    // messageLabel frame values
    CGFloat messageWidth, messageHeight, messageLeft, messageTop;

    if(messageLabel != nil) {
        messageWidth = messageLabel.bounds.size.width;
        messageHeight = messageLabel.bounds.size.height;
        messageLeft = imageLeft + imageWidth + YCYToastHorizontalPadding;
        messageTop = titleTop + titleHeight + YCYToastVerticalPadding;
    } else {
        messageWidth = messageHeight = messageLeft = messageTop = 0.0;
    }

    CGFloat longerWidth = MAX(titleWidth, messageWidth);
    CGFloat longerLeft = MAX(titleLeft, messageLeft);
    
    // wrapper width uses the longerWidth or the image width, whatever is larger. same logic applies to the wrapper height
    CGFloat wrapperWidth = MAX((imageWidth + (YCYToastHorizontalPadding * 2)), (longerLeft + longerWidth + YCYToastHorizontalPadding));    
    CGFloat wrapperHeight = MAX((messageTop + messageHeight + YCYToastVerticalPadding), (imageHeight + (YCYToastVerticalPadding * 2)));
                         
    wrapperView.frame = CGRectMake(0.0, 0.0, wrapperWidth, wrapperHeight);
    
    if(titleLabel != nil) {
        titleLabel.frame = CGRectMake(titleLeft, titleTop, titleWidth, titleHeight);
        [wrapperView addSubview:titleLabel];
    }
    
    if(messageLabel != nil) {
        messageLabel.frame = CGRectMake(messageLeft, messageTop, messageWidth, messageHeight);
        [wrapperView addSubview:messageLabel];
    }
    
    if(imageView != nil) {
        [wrapperView addSubview:imageView];
    }
        
    return wrapperView;
}

@end
