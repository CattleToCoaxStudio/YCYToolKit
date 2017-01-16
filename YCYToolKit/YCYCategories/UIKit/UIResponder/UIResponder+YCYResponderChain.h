//
//  UIResponder+YCYResponderChain.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (YCYResponderChain)

/**
 响应者链

 @return 响应者链
 */
- (NSString *)ycy_responderChainDescription;
@end
