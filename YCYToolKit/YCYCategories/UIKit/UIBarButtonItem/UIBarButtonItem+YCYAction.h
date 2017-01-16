//
//  UIBarButtonItem+JKAction.h
//  JKCategories (https://github.com/shaojiankui/JKCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^BarButtonYCYActionBlock)();

@interface UIBarButtonItem (YCYAction)

/// A block that is run when the UIBarButtonItem is tapped.
//@property (nonatomic, copy) dispatch_block_t actionBlock;
- (void)setYCY_actionBlock:(BarButtonYCYActionBlock)actionBlock;

@end
