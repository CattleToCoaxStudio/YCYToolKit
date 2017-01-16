//
//  UIResponder+YCYFirstResponder.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIResponder+YCYFirstResponder.h"

static __weak id ycy_currentFirstResponder;

@implementation UIResponder (YCYFirstResponder)
+ (id)ycy_currentFirstResponder {
    ycy_currentFirstResponder = nil;
    
    [[UIApplication sharedApplication] sendAction:@selector(ycy_findCurrentFirstResponder:) to:nil from:nil forEvent:nil];
    
    return ycy_currentFirstResponder;
}

- (void)ycy_findCurrentFirstResponder:(id)sender {
    ycy_currentFirstResponder = self;
}
@end
