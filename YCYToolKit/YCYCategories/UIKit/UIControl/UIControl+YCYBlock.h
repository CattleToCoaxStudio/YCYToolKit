//
//  UIControl+YCYBlock.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (YCYBlock)


/**
 触发相应事件

 @param eventBlock block
 */
- (void)ycy_touchDown:(void (^)(void))eventBlock;
- (void)ycy_touchDownRepeat:(void (^)(void))eventBlock;
- (void)ycy_touchDragInside:(void (^)(void))eventBlock;
- (void)ycy_touchDragOutside:(void (^)(void))eventBlock;
- (void)ycy_touchDragEnter:(void (^)(void))eventBlock;
- (void)ycy_touchDragExit:(void (^)(void))eventBlock;
- (void)ycy_touchUpInside:(void (^)(void))eventBlock;
- (void)ycy_touchUpOutside:(void (^)(void))eventBlock;
- (void)ycy_touchCancel:(void (^)(void))eventBlock;
- (void)ycy_valueChanged:(void (^)(void))eventBlock;
- (void)ycy_editingDidBegin:(void (^)(void))eventBlock;
- (void)ycy_editingChanged:(void (^)(void))eventBlock;
- (void)ycy_editingDidEnd:(void (^)(void))eventBlock;
- (void)ycy_editingDidEndOnExit:(void (^)(void))eventBlock;

@end
