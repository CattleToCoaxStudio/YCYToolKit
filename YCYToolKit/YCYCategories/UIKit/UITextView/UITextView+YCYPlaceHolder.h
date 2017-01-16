//
//  UITextView+YCYPlaceHolder.h
//  Category
//
//  Created by yangchengyou on 17/1/11.
//  Copyright © 2017年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^textViewHeightDidChangedBlock)(CGFloat currentTextViewHeight);

@interface UITextView (YCYPlaceHolder)

/* 占位文字 */
@property (nonatomic, copy) NSString *placeholder;

/* 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

/* 最大高度，如果需要随文字改变高度的时候使用 */
@property (nonatomic, assign) CGFloat maxHeight;
@property (nonatomic, copy) textViewHeightDidChangedBlock textViewHeightDidChanged;
/* 自动高度的方法，maxHeight：最大高度， textHeightDidChanged：高度改变的时候调用 */
- (void)ycy_autoHeightWithMaxHeight:(CGFloat)maxHeight textViewHeightDidChanged:(textViewHeightDidChangedBlock)textViewHeightDidChanged;
/* 添加一张图片 image:要添加的图片 */
- (void)ycy_addImage:(UIImage *)image;
/* 添加一张图片 image:要添加的图片 size:图片大小 */
- (void)ycy_addImage:(UIImage *)image size:(CGSize)size;
/* 插入一张图片 image:要添加的图片 size:图片大小 index:插入的位置 */
- (void)ycy_insertImage:(UIImage *)image size:(CGSize)size index:(NSInteger)index;

/* 添加一张图片 image:要添加的图片 multiple:放大／缩小的倍数 */
- (void)ycy_addImage:(UIImage *)image multiple:(CGFloat)multiple;
/* 插入一张图片 image:要添加的图片 multiple:放大／缩小的倍数 index:插入的位置 */
- (void)ycy_insertImage:(UIImage *)image multiple:(CGFloat)multiple index:(NSInteger)index;
@end
