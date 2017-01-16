

#import <UIKit/UIKit.h>

extern NSString * const YCYToastPositionTop;
extern NSString * const YCYToastPositionCenter;
extern NSString * const YCYToastPositionBottom;

@interface UIView (YCYToast)

// each makeToast method creates a view and displays it as toast
- (void)ycy_makeToast:(NSString *)message;
- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position;
- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position image:(UIImage *)image;
- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title;
- (void)ycy_makeToast:(NSString *)message duration:(NSTimeInterval)interval position:(id)position title:(NSString *)title image:(UIImage *)image;

// displays toast with an activity spinner
- (void)ycy_makeToastActivity;
- (void)ycy_makeToastActivity:(id)position;
- (void)ycy_hideToastActivity;

// the showToast methods display any view as toast
- (void)ycy_showToast:(UIView *)toast;
- (void)ycy_showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point;
- (void)ycy_showToast:(UIView *)toast duration:(NSTimeInterval)interval position:(id)point
      tapCallback:(void(^)(void))tapCallback;

@end
