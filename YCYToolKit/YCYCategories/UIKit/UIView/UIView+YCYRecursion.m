//
//  UIView+YCYRecursion.m
//
//  Created by Jakey on 15/6/23.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+YCYRecursion.h"

@implementation UIView (YCYRecursion)
/**
 *  @brief  寻找子视图
 *
 *  @param recurse 回调
 *
 *  @return  Return YES from the block to recurse into the subview.
 Set stop to YES to return the subview.
 */
- (UIView*)ycy_findViewRecursively:(BOOL(^)(UIView* subview, BOOL* stop))recurse
{
    for( UIView* subview in self.subviews ) {
        BOOL stop = NO;
        if( recurse( subview, &stop ) ) {
            return [subview ycy_findViewRecursively:recurse];
        } else if( stop ) {
            return subview;
        }
    }
    
    return nil;
}


-(void)ycy_runBlockOnAllSubviews:(YCYSubviewBlock)block
{
    block(self);
    for (UIView* view in [self subviews])
    {
        [view ycy_runBlockOnAllSubviews:block];
    }
}

-(void)ycy_runBlockOnAllSuperviews:(YCYSuperviewBlock)block
{
    block(self);
    if (self.superview)
    {
        [self.superview ycy_runBlockOnAllSuperviews:block];
    }
}

-(void)ycy_enableAllControlsInViewHierarchy
{
    [self ycy_runBlockOnAllSubviews:^(UIView *view) {
        
        if ([view isKindOfClass:[UIControl class]])
        {
            [(UIControl *)view setEnabled:YES];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            [(UITextView *)view setEditable:YES];
        }
    }];
}

-(void)ycy_disableAllControlsInViewHierarchy
{
    [self ycy_runBlockOnAllSubviews:^(UIView *view) {
        
        if ([view isKindOfClass:[UIControl class]])
        {
            [(UIControl *)view setEnabled:NO];
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            [(UITextView *)view setEditable:NO];
        }
    }];
}
@end
