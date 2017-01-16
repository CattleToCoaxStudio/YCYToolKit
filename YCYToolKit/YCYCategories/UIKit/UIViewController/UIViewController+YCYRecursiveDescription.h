//
//  UIViewController+RecursiveDescription.h
//  HLiPad
//
//  Created by Richard Turton on 07/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (YCYRecursiveDescription)
/**
 *  @brief  视图层级
 *
 *  @return 视图层级字符串
 */
-(NSString*)ycy_recursiveDescription;

@end
