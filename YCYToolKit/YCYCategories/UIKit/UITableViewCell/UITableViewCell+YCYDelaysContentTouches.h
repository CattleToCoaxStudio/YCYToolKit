//
//  UITableViewCell+YCYDelaysContentTouches.h
//  tableViewCellDelaysContentTouches
//
//  Created by Nicholas Hodapp on 1/31/14.
//  Copyright (c) 2014 Nicholas Hodapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (YCYDelaysContentTouches)

/**
 cell是否在手指滑动的时候触发滚动效果 YES 默认会触发   NO 永不触发
 */
@property (nonatomic, assign) BOOL ycy_delaysContentTouches;

@end
