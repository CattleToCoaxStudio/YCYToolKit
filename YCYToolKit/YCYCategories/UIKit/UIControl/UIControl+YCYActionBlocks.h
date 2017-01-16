//
//  UIControl+YCYActionBlocks.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^UIControlYCYActionBlock)(id weakSender);


@interface UIControlYCYActionBlockWrapper : NSObject
@property (nonatomic, copy) UIControlYCYActionBlock ycy_actionBlock;
@property (nonatomic, assign) UIControlEvents ycy_controlEvents;
- (void)ycy_invokeBlock:(id)sender;
@end


@interface UIControl (YCYActionBlocks)

/**
 设置触发事件

 @param controlEvents 触发类型
 @param actionBlock block
 */
- (void)ycy_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlYCYActionBlock)actionBlock;
- (void)ycy_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
