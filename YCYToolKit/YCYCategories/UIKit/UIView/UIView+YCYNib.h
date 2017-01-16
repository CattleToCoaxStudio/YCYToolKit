//
//  UIView+YCYNib.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (YCYNib)

/**
 加载nib

 @return 返回相同类名的nib
 */
+ (UINib *)ycy_loadNib;

/**
 加载nib

 @param nibName nibname
 @return 根据nibname返回相应nib
 */
+ (UINib *)ycy_loadNibNamed:(NSString*)nibName;
+ (UINib *)ycy_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;

/**
 返回nib文件类对象

 @return 返回相同类名的类对象
 */
+ (instancetype)ycy_loadInstanceFromNib;

/**
 返回nib文件类对象

 @param nibName nibname
 @return 返回相同类名的类对象
 */
+ (instancetype)ycy_loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)ycy_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)ycy_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
