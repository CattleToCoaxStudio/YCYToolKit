

#import <UIKit/UIKit.h>

@interface UINavigationController (YCYTransitions)

/**
 带动画push

 @param controller VC
 @param transition UIViewAnimationTransition
 */
- (void)ycy_pushViewController:(UIViewController *)controller withTransition:(UIViewAnimationTransition)transition;
/**
 带动画pop
 
 @param transition UIViewAnimationTransition
 */
- (UIViewController *)ycy_popViewControllerWithTransition:(UIViewAnimationTransition)transition;

@end
