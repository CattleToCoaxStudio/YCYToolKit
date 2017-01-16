//
//  UITableViewCell+YCYNIB.
//
//  Created by ycy on 14/11/19.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import "UITableViewCell+YCYNIB.h"

@implementation UITableViewCell (YCYNIB)
/**
 *  @brief  加载同类名的nib
 *
 *  @return nib
 */
+(UINib*)ycy_nib{
   return  [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end
