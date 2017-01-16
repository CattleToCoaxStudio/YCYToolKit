//
//  UIApplication+YCYNetworkActivityIndicator.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIApplication+YCYNetworkActivityIndicator.h"
#import <libkern/OSAtomic.h>
@implementation UIApplication (YCYNetworkActivityIndicator)


static volatile int32_t numberOfActiveNetworkConnectionsxxx;
#pragma mark Public API

- (void)jk_beganNetworkActivity
{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(1, &numberOfActiveNetworkConnectionsxxx) > 0;
}

- (void)jk_endedNetworkActivity
{
    self.networkActivityIndicatorVisible = OSAtomicAdd32(-1, &numberOfActiveNetworkConnectionsxxx) > 0;
}
@end
