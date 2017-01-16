//
//  UITableViewCell+YCYDelaysContentTouches.m
//  tableViewCellDelaysContentTouches
//
//  Created by Nicholas Hodapp on 1/31/14.
//  Copyright (c) 2014 Nicholas Hodapp. All rights reserved.
//

#import "UITableViewCell+YCYDelaysContentTouches.h"

@implementation UITableViewCell (YCYDelaysContentTouches)

- (UIScrollView*) ycy_scrollView
{
    id sv = self.contentView.superview;
    while ( ![sv isKindOfClass: [UIScrollView class]] && sv != self )
    {
        sv = [sv superview];
    }
    
    return sv == self ? nil : sv;
}

- (void) setYcy_delaysContentTouches:(BOOL)delaysContentTouches
{
    [self willChangeValueForKey: @"ycy_delaysContentTouches"];
    
    [[self ycy_scrollView] setDelaysContentTouches: delaysContentTouches];
    
    [self didChangeValueForKey: @"ycy_delaysContentTouches"];
}

- (BOOL) ycy_delaysContentTouches
{
    return [[self ycy_scrollView] delaysContentTouches];
}



@end
