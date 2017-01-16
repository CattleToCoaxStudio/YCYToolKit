//
//  NSIndexPath+YCYOffset.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSIndexPath (YCYOffset)
/**
 *  @author YCYCategories
 *
 *  Compute previous row indexpath
 *
 */
- (NSIndexPath *)ycy_previousRow;
/**
 *  @author YCYCategories
 *
 *  Compute next row indexpath
 *
 */
- (NSIndexPath *)ycy_nextRow;
/**
 *  @author YCYCategories
 *
 *  Compute previous item indexpath
 *
 */
- (NSIndexPath *)ycy_previousItem;
/**
 *  @author YCYCategories
 *
 *  Compute next item indexpath
 *
 */
- (NSIndexPath *)ycy_nextItem;
/**
 *  @author YCYCategories
 *
 *  Compute next section indexpath
 *
 */
- (NSIndexPath *)ycy_nextSection;
/**
 *  @author YCYCategories
 *
 *  Compute previous section indexpath
 *
 */
- (NSIndexPath *)ycy_previousSection;
@end
