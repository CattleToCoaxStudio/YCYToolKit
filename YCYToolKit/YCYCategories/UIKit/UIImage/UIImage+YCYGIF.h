//
//  UIImage+YCYGIF.h
//  LBGIFImage
//
//  Created by Laurin Brandner on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YCYGIF)


/**
 返回gif

 @param name gif名字
 @return gif
 */
+ (UIImage *)ycy_animatedGIFNamed:(NSString *)name;

/**
 返回gif
 
 @param data   data
 @return gif
 */
+ (UIImage *)ycy_animatedGIFWithData:(NSData *)data;

//缩放裁剪
- (UIImage *)ycy_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
