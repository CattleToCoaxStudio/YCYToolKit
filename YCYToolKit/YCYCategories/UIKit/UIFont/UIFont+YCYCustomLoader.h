//
//  UIFont+YCYCustomLoader.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (YCYCustomLoader)


/**
 返回font

 @param size 字体大小
 @param name 字体文件名
 @param extension 后缀
 @return return font
 */
+ (UIFont *)ycy_customFontOfSize:(CGFloat)size withName:(NSString *)name withExtension:(NSString *)extension;


/**
 font

 @param fontURL 本地文件url
 @param size 字体大小
 @return font
 */
+ (UIFont *)ycy_customFontWithURL:(NSURL *)fontURL size:(CGFloat)size;

/// @name Explicit registration

/**
 Allow custom fonts registration.
 
 With this method you can load all supported font file: ttf, otf, ttc and otc.
 Font that are already registered, with this library or by system, will not be
 registered and you will see a warning log.
 
 @param fontURL Font file absolute url
 @return An array of postscript name which represent the file's font(s) or `nil`
 on errors. (With iOS < 7 as target you will see an empty array for collections)
 */
+ (NSArray *)ycy_registerFontFromURL:(NSURL *)fontURL;

@end
