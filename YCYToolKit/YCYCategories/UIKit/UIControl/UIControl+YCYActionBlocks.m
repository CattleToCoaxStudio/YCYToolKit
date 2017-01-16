//
//  UIControl+YCYActionBlocks.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIControl+YCYActionBlocks.h"
#import <objc/runtime.h>

static const void *UIControlYCYActionBlockArray = &UIControlYCYActionBlockArray;

@implementation UIControlYCYActionBlockWrapper

- (void)ycy_invokeBlock:(id)sender {
    if (self.ycy_actionBlock) {
        self.ycy_actionBlock(sender);
    }
}
@end

@implementation UIControl (YCYActionBlocks)
-(void)ycy_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlYCYActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self ycy_actionBlocksArray];
    
    UIControlYCYActionBlockWrapper *blockActionWrapper = [[UIControlYCYActionBlockWrapper alloc] init];
    blockActionWrapper.ycy_actionBlock = actionBlock;
    blockActionWrapper.ycy_controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(ycy_invokeBlock:) forControlEvents:controlEvents];
}


- (void)ycy_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self ycy_actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIControlYCYActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.ycy_controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(ycy_invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
}


- (NSMutableArray *)ycy_actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, UIControlYCYActionBlockArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, UIControlYCYActionBlockArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}
@end
