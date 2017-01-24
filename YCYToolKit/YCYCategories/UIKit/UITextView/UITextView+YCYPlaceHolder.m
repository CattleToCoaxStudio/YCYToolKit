//
//  UITextView+YCYPlaceHolder.m
//  Category
//
//  Created by yangchengyou on 17/1/11.
//  Copyright © 2017年 NULLS. All rights reserved.
//

#import "UITextView+YCYPlaceHolder.h"
#import <objc/runtime.h>

// 占位文字
static const void *YCYPlaceholderViewKey = &YCYPlaceholderViewKey;
// 占位文字颜色
static const void *YCYPlaceholderColorKey = &YCYPlaceholderColorKey;
// 最大高度
static const void *YCYTextViewMaxHeightKey = &YCYTextViewMaxHeightKey;
// 高度变化的block
static const void *YCYTextViewHeightDidChangedBlockKey = &YCYTextViewHeightDidChangedBlockKey;

@implementation UITextView (YCYPlaceHolder)

#pragma mark - Swizzle Dealloc

+ (void)ycy_load {
    // 交换dealoc
    Method dealoc = class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc"));
    Method myDealoc = class_getInstanceMethod(self.class, @selector(ycy_myDealoc));
    method_exchangeImplementations(dealoc, myDealoc);
}

- (void)ycy_myDealoc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    UITextView *placeholderView = objc_getAssociatedObject(self, YCYPlaceholderViewKey);
    
    // 如果有值才去调用，这步很重要
    if (placeholderView) {
        NSArray *propertys = @[@"frame", @"bounds", @"font", @"text", @"textAlignment", @"textContainerInset"];
        for (NSString *property in propertys) {
            [self removeObserver:self forKeyPath:property];
        }
    }
    [UITextView ycy_load];
}

- (UITextView *)placeholderView {
    
    // 为了让占位文字和textView的实际文字位置能够完全一致，这里用UITextView
    UITextView *placeholderView = objc_getAssociatedObject(self, YCYPlaceholderViewKey);
    
    if (!placeholderView) {
        
        placeholderView = [[UITextView alloc] init];
        
        // 动态添加属性的本质是: 让对象的某个属性与值产生关联
        objc_setAssociatedObject(self, YCYPlaceholderViewKey, placeholderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        placeholderView = placeholderView;
        
        // 设置基本属性
        self.scrollEnabled = placeholderView.scrollEnabled = placeholderView.showsHorizontalScrollIndicator = placeholderView.showsVerticalScrollIndicator = placeholderView.userInteractionEnabled = NO;
        placeholderView.textColor = [UIColor lightGrayColor];
        placeholderView.backgroundColor = [UIColor clearColor];
        [self ycy_refreshPlaceholderView];
        [self addSubview:placeholderView];
        
        // 监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ycy_textViewTextChange) name:UITextViewTextDidChangeNotification object:self];
        
        // 这些属性改变时，都要作出一定的改变，尽管已经监听了TextDidChange的通知，也要监听text属性，因为通知监听不到setText：
        NSArray *propertys = @[@"frame", @"bounds", @"font", @"text", @"textAlignment", @"textContainerInset"];
        
        // 监听属性
        for (NSString *property in propertys) {
            [self addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:nil];
        }
        
    }
    return placeholderView;
}

- (void)ycy_refreshPlaceholderView {
    
    UITextView *placeholderView = objc_getAssociatedObject(self, YCYPlaceholderViewKey);
    
    // 如果有值才去调用，这步很重要
    if (placeholderView) {
        self.placeholderView.frame = self.bounds;
        self.placeholderView.font = self.font;
        self.placeholderView.textAlignment = self.textAlignment;
        self.placeholderView.textContainerInset = self.textContainerInset;
    }
}

#pragma mark - KVO监听属性改变
- (void)ycy_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self ycy_refreshPlaceholderView];
    if ([keyPath isEqualToString:@"text"]) {
        [self ycy_textViewTextChange];
    }
}

#pragma mark - set && get
- (void)setPlaceholder:(NSString *)placeholder
{
    // 为placeholder赋值
    [self placeholderView].text = placeholder;
    [UITextView ycy_load];
}

- (NSString *)placeholder
{
    // 如果有placeholder值才去调用，这步很重要
    if (self.placeholderExist) {
        return [self placeholderView].text;
    }
    return nil;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    // 如果有placeholder值才去调用，这步很重要
    if (self.placeholderExist) {
        NSLog(@"请先设置placeholder值！");
    } else {
        self.placeholderView.textColor = placeholderColor;
        
        // 动态添加属性的本质是: 让对象的某个属性与值产生关联
        objc_setAssociatedObject(self, YCYPlaceholderColorKey, placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, YCYPlaceholderColorKey);
}

- (void)setMaxHeight:(CGFloat)maxHeight {
    
    CGFloat max = maxHeight;
    
    // 如果传入的最大高度小于textView本身的高度，则让最大高度等于本身高度
    if (maxHeight < self.frame.size.height) {
        max = self.frame.size.height;
    }
    
    objc_setAssociatedObject(self, YCYTextViewMaxHeightKey, [NSString stringWithFormat:@"%lf", max], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)maxHeight {
    return [objc_getAssociatedObject(self, YCYTextViewMaxHeightKey) doubleValue];
}

- (void)setTextViewHeightDidChanged:(textViewHeightDidChangedBlock)textViewHeightDidChanged {
    objc_setAssociatedObject(self, YCYTextViewHeightDidChangedBlockKey, textViewHeightDidChanged, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (textViewHeightDidChangedBlock)textViewHeightDidChanged {
    void(^textViewHeightDidChanged)(CGFloat currentHeight) = objc_getAssociatedObject(self, YCYTextViewHeightDidChangedBlockKey);
    return textViewHeightDidChanged;
}

- (void)ycy_textViewTextChange {
    UITextView *placeholderView = objc_getAssociatedObject(self, YCYPlaceholderViewKey);
    
    // 如果有值才去调用，这步很重要
    if (placeholderView) {
        self.placeholderView.hidden = (self.text.length > 0 && self.text);
    }
    
    if (self.maxHeight >= self.bounds.size.height) {
        
        // 计算高度
        NSInteger currentHeight = ceil([self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)].height);
        NSInteger lastheight = ceil(self.maxHeight + self.textContainerInset.top + self.textContainerInset.bottom);
        
        // 如果高度有变化，调用block
        if (currentHeight != lastheight) {
            
            self.scrollEnabled = currentHeight >= self.maxHeight;
            if (self.textViewHeightDidChanged) {
                self.textViewHeightDidChanged(currentHeight >= self.maxHeight ? self.maxHeight : currentHeight);
            }
        }
    }
    
    if (!self.isFirstResponder) {
        [self becomeFirstResponder];
    }
}

- (void)ycy_autoHeightWithMaxHeight:(CGFloat)maxHeight textViewHeightDidChanged:(void(^)(CGFloat currentTextViewHeight))textViewHeightDidChanged {
    self.maxHeight = maxHeight;
    self.textViewHeightDidChanged = textViewHeightDidChanged;
}

// 判断是否有placeholder值，这步很重要
- (BOOL)placeholderExist {
    
    // 获取对应属性的值
    UITextView *placeholderView = objc_getAssociatedObject(self, YCYPlaceholderViewKey);
    
    // 如果有placeholder值
    if (placeholderView) {
        return YES;
    }
    
    return NO;
}

- (void)ycy_addImage:(UIImage *)image {
    [self ycy_addImage:image size:CGSizeZero];
}

/* 添加一张图片 image:要添加的图片 size:图片大小 */
- (void)ycy_addImage:(UIImage *)image size:(CGSize)size {
    [self ycy_insertImage:image size:size index:self.attributedText.length > 0 ? self.attributedText.length : 0];
}
/* 插入一张图片 image:要添加的图片 size:图片大小 index:插入的位置 */
- (void)ycy_insertImage:(UIImage *)image size:(CGSize)size index:(NSInteger)index {
    [self ycy_addImage:image size:size index:index multiple:-1];
}

/* 添加一张图片 image:要添加的图片 multiple:放大／缩小的倍数 */
- (void)ycy_addImage:(UIImage *)image multiple:(CGFloat)multiple {
    [self ycy_addImage:image size:CGSizeZero index:self.attributedText.length > 0 ? self.attributedText.length : 0 multiple:multiple];
}
/* 插入一张图片 image:要添加的图片 multiple:放大／缩小的倍数 index:插入的位置 */
- (void)ycy_insertImage:(UIImage *)image multiple:(CGFloat)multiple index:(NSInteger)index {
    [self ycy_addImage:image size:CGSizeZero index:index multiple:multiple];
}

- (void)ycy_addImage:(UIImage *)image size:(CGSize)size index:(NSInteger)index multiple:(CGFloat)multiple {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = image;
    CGRect bounds = textAttachment.bounds;
    if (!CGSizeEqualToSize(size, CGSizeZero)) {
        bounds.size = size;
        textAttachment.bounds = bounds;
    } else if (multiple <= 0) {
        CGFloat oldWidth = textAttachment.image.size.width;
        CGFloat scaleFactor = oldWidth / (self.frame.size.width - 10);
        textAttachment.image = [UIImage imageWithCGImage:textAttachment.image.CGImage scale:scaleFactor orientation:UIImageOrientationUp];
    } else {
        bounds.size = image.size;
        textAttachment.bounds = bounds;
    }
    
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString replaceCharactersInRange:NSMakeRange(index, 0) withAttributedString:attrStringWithImage];
    self.attributedText = attributedString;
    [self ycy_textViewTextChange];
    [self ycy_refreshPlaceholderView];
    
}


@end
