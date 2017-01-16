

#import "UINavigationController+YCYKeyboardFix.h"

@implementation UINavigationController (YCYKeyboardFix)

// This fixes an issue with the keyboard not dismissing on the iPad's login screen.
// http://stackoverflow.com/questions/3372333/ipad-keyboard-will-not-dismiss-if-modal-view-controller-presentation-style-is-ui/3386768#3386768
// http://developer.apple.com/library/ios/#documentation/uikit/reference/UIViewController_Class/Reference/Reference.html
//http://www.cnblogs.com/SnailFish/archive/2013/03/30/2991026.html

//解决在 ipad中 resignFirstResponder 无法使用  
- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

@end
