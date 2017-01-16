//
//  UIViewController+RecursiveDescription.m
//  HLiPad
//
//  Created by Richard Turton on 07/01/2013.
//
//

#import "UIViewController+YCYRecursiveDescription.h"

@implementation UIViewController (YCYRecursiveDescription)
/**
 *  @brief  视图层级
 *
 *  @return 视图层级字符串
 */
-(NSString*)ycy_recursiveDescription
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"\n"];
    [self ycy_addDescriptionToString:description indentLevel:0];
    return description;
}

-(void)ycy_addDescriptionToString:(NSMutableString*)string indentLevel:(NSInteger)indentLevel
{
    NSString *padding = [@"" stringByPaddingToLength:indentLevel withString:@" " startingAtIndex:0];
    [string appendString:padding];
    [string appendFormat:@"%@, %@",[self debugDescription],NSStringFromCGRect(self.view.frame)];

    for (UIViewController *childController in self.childViewControllers)
    {
        [string appendFormat:@"\n%@>",padding];
        [childController ycy_addDescriptionToString:string indentLevel:indentLevel + 1];
    }
}

@end
