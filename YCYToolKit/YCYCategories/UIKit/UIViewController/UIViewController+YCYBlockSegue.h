

#import <UIKit/UIKit.h>

typedef void (^UIViewControllerYCYSegueBlock) (id sender, id destinationVC, UIStoryboardSegue *segue);

@interface UIViewController (YCYBlockSegue)

/**
 storyboard执行跳转 block回调

 @param identifier 标识符
 @param block blcok
 */
-(void)ycy_configureSegue:(NSString *)identifier withBlock:(UIViewControllerYCYSegueBlock)block;

/**
 storyboard执行跳转 block回调

 @param identifier 标识符
 @param sender sender可是任何对象
 @param block block
 */
-(void)ycy_performSegueWithIdentifier:(NSString *)identifier sender:(id)sender withBlock:(UIViewControllerYCYSegueBlock)block;

@end
