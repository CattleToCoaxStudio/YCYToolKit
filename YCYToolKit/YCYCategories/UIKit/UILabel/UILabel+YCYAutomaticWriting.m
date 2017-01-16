//
//  UILabel+AutomaticWriting.m
//  UILabel-AutomaticWriting
//
//  Created by alexruperez on 10/3/15.
//  Copyright (c) 2015 alexruperez. All rights reserved.
//

#import "UILabel+YCYAutomaticWriting.h"
#import <objc/runtime.h>


NSTimeInterval const UILabelAWDefaultDuration = 0.4f;

unichar const UILabelAWDefaultCharacter = 124;

static inline void ycy_AutomaticWritingSwizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

static char kAutomaticWritingOperationQueueKey;
static char kAutomaticWritingEdgeInsetsKey;


@implementation UILabel (YCYAutomaticWriting)

@dynamic ycy_automaticWritingOperationQueue, ycy_edgeInsets;

#pragma mark - Public Methods

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ycy_AutomaticWritingSwizzleSelector([self class], @selector(textRectForBounds:limitedToNumberOfLines:), @selector(ycy_automaticWritingTextRectForBounds:limitedToNumberOfLines:));
        ycy_AutomaticWritingSwizzleSelector([self class], @selector(drawTextInRect:), @selector(ycy_drawAutomaticWritingTextInRect:));
    });
}

-(void)ycy_drawAutomaticWritingTextInRect:(CGRect)rect
{
    [self ycy_drawAutomaticWritingTextInRect:UIEdgeInsetsInsetRect(rect, self.ycy_edgeInsets)];
}

- (CGRect)ycy_automaticWritingTextRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [self ycy_automaticWritingTextRectForBounds:UIEdgeInsetsInsetRect(bounds, self.ycy_edgeInsets) limitedToNumberOfLines:numberOfLines];
    return textRect;
}

- (void)setycy_edgeInsets:(UIEdgeInsets)edgeInsets
{
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, [NSValue valueWithUIEdgeInsets:edgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)ycy_edgeInsets
{
    NSValue *edgeInsetsValue = objc_getAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey);
    
    if (edgeInsetsValue)
    {
        return edgeInsetsValue.UIEdgeInsetsValue;
    }
    
    edgeInsetsValue = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
    
    objc_setAssociatedObject(self, &kAutomaticWritingEdgeInsetsKey, edgeInsetsValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return edgeInsetsValue.UIEdgeInsetsValue;
}

- (void)setycy_automaticWritingOperationQueue:(NSOperationQueue *)automaticWritingOperationQueue
{
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, automaticWritingOperationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSOperationQueue *)ycy_automaticWritingOperationQueue
{
    NSOperationQueue *operationQueue = objc_getAssociatedObject(self, &kAutomaticWritingOperationQueueKey);
    
    if (operationQueue)
    {
        return operationQueue;
    }
    
    operationQueue = NSOperationQueue.new;
    operationQueue.name = @"Automatic Writing Operation Queue";
    operationQueue.maxConcurrentOperationCount = 1;
    
    objc_setAssociatedObject(self, &kAutomaticWritingOperationQueueKey, operationQueue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return operationQueue;
}

- (void)ycy_setTextWithAutomaticWritingAnimation:(NSString *)text
{
    [self ycy_setText:text automaticWritingAnimationWithBlinkingMode:UILabelYCYlinkingModeNone];
}

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithBlinkingMode:(UILabelYCYlinkingMode)blinkingMode
{
    [self ycy_setText:text automaticWritingAnimationWithDuration:UILabelAWDefaultDuration blinkingMode:blinkingMode];
}

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration
{
    [self ycy_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:UILabelYCYlinkingModeNone];
}

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelYCYlinkingMode)blinkingMode
{
    [self ycy_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:UILabelAWDefaultCharacter];
}

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelYCYlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter
{
    [self ycy_setText:text automaticWritingAnimationWithDuration:duration blinkingMode:blinkingMode blinkingCharacter:blinkingCharacter completion:nil];
}

- (void)ycy_setText:(NSString *)text automaticWritingAnimationWithDuration:(NSTimeInterval)duration blinkingMode:(UILabelYCYlinkingMode)blinkingMode blinkingCharacter:(unichar)blinkingCharacter completion:(void (^)(void))completion
{
    self.ycy_automaticWritingOperationQueue.suspended = YES;
    self.ycy_automaticWritingOperationQueue = nil;
    
    self.text = @"";
    
    NSMutableString *automaticWritingText = NSMutableString.new;
    
    if (text)
    {
        [automaticWritingText appendString:text];
    }
    
    [self.ycy_automaticWritingOperationQueue addOperationWithBlock:^{
        [self ycy_automaticWriting:automaticWritingText duration:duration mode:blinkingMode character:blinkingCharacter completion:completion];
    }];
}

#pragma mark - Private Methods

- (void)ycy_automaticWriting:(NSMutableString *)text duration:(NSTimeInterval)duration mode:(UILabelYCYlinkingMode)mode character:(unichar)character completion:(void (^)(void))completion
{
    NSOperationQueue *currentQueue = NSOperationQueue.currentQueue;
    if ((text.length || mode >= UILabelYCYlinkingModeWhenFinish) && !currentQueue.isSuspended)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (mode != UILabelYCYlinkingModeNone)
            {
                if ([self ycy_isLastCharacter:character])
                {
                    [self ycy_deleteLastCharacter];
                }
                else if (mode != UILabelYCYlinkingModeWhenFinish || !text.length)
                {
                    [text insertString:[self ycy_stringWithCharacter:character] atIndex:0];
                }
            }
            
            if (text.length)
            {
                [self ycy_appendCharacter:[text characterAtIndex:0]];
                [text deleteCharactersInRange:NSMakeRange(0, 1)];
                if ((![self ycy_isLastCharacter:character] && mode == UILabelYCYlinkingModeWhenFinishShowing) || (!text.length && mode == UILabelYCYlinkingModeUntilFinishKeeping))
                {
                    [self ycy_appendCharacter:character];
                }
            }
            
            if (!currentQueue.isSuspended)
            {
                [currentQueue addOperationWithBlock:^{
                    [self ycy_automaticWriting:text duration:duration mode:mode character:character completion:completion];
                }];
            }
            else if (completion)
            {
                completion();
            }
        });
    }
    else if (completion)
    {
        completion();
    }
}

- (NSString *)ycy_stringWithCharacter:(unichar)character
{
    return [self ycy_stringWithCharacters:@[@(character)]];
}

- (NSString *)ycy_stringWithCharacters:(NSArray *)characters
{
    NSMutableString *string = NSMutableString.new;
    
    for (NSNumber *character in characters)
    {
        [string appendFormat:@"%C", character.unsignedShortValue];
    }
    
    return string.copy;
}

- (void)ycy_appendCharacter:(unichar)character
{
    [self ycy_appendCharacters:@[@(character)]];
}

- (void)ycy_appendCharacters:(NSArray *)characters
{
    self.text = [self.text stringByAppendingString:[self ycy_stringWithCharacters:characters]];
}

- (BOOL)ycy_isLastCharacters:(NSArray *)characters
{
    if (self.text.length >= characters.count)
    {
        return [self.text hasSuffix:[self ycy_stringWithCharacters:characters]];
    }
    return NO;
}

- (BOOL)ycy_isLastCharacter:(unichar)character
{
    return [self ycy_isLastCharacters:@[@(character)]];
}

- (BOOL)ycy_deleteLastCharacters:(NSUInteger)characters
{
    if (self.text.length >= characters)
    {
        self.text = [self.text substringToIndex:self.text.length-characters];
        return YES;
    }
    return NO;
}

- (BOOL)ycy_deleteLastCharacter
{
    return [self ycy_deleteLastCharacters:1];
}

@end
