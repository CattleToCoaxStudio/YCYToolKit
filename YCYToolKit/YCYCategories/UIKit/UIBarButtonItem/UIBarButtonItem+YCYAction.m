//
//  UIBarButtonItem+ycyAction.m
//  ycyCategories (https://github.com/shaojiankui/ycyCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

char * const UIBarButtonItemYCYActionBlock = "UIBarButtonItemYCYActionBlock";
#import "UIBarButtonItem+YCYAction.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (YCYAction)

- (void)ycy_performActionBlock {
    
    dispatch_block_t block = self.ycy_actionBlock;
    
    if (block)
        block();
    
}

- (BarButtonYCYActionBlock)ycy_actionBlock {
    return objc_getAssociatedObject(self, UIBarButtonItemYCYActionBlock);
}

- (void)setYCY_actionBlock:(BarButtonYCYActionBlock)actionBlock
 {
    
    if (actionBlock != self.ycy_actionBlock) {
        [self willChangeValueForKey:@"ycy_actionBlock"];
        
        objc_setAssociatedObject(self,
                                 UIBarButtonItemYCYActionBlock,
                                 actionBlock,
                                 OBJC_ASSOCIATION_COPY);
        
        // Sets up the action.
        [self setTarget:self];
        [self setAction:@selector(ycy_performActionBlock)];
        
        [self didChangeValueForKey:@"ycy_actionBlock"];
    }
}
@end
