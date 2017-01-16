//
//  UIView+YCYNib.h
//
//  Created by ycy on 14/12/15.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import "UIView+YCYNib.h"

@implementation UIView (YCYNib)
#pragma mark - Nibs
+ (UINib *)ycy_loadNib
{
    return [self ycy_loadNibNamed:NSStringFromClass([self class])];
}
+ (UINib *)ycy_loadNibNamed:(NSString*)nibName
{
    return [self ycy_loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}
+ (UINib *)ycy_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:nibName bundle:bundle];
}
+ (instancetype)ycy_loadInstanceFromNib
{
    return [self ycy_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}
+ (instancetype)ycy_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self ycy_loadInstanceFromNibWithName:nibName owner:nil];
}
+ (instancetype)ycy_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self ycy_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}
+ (instancetype)ycy_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}

@end
