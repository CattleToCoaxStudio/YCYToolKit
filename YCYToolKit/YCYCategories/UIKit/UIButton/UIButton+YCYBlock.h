//
//  UIButton+Block.h

//  Created by ycy on 14/12/30.
//  Copyright (c) 2014年 NULLS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^YCYTouchedButtonBlock)(NSInteger tag);

@interface UIButton (YCYBlock)

/**
 点击事件回调

 @param touchHandler handler
 */
-(void)ycy_addActionHandler:(YCYTouchedButtonBlock)touchHandler;
@end
