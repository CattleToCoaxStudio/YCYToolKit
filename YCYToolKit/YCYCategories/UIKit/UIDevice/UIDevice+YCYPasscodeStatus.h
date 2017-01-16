//
//  UIDevice+YCYPasscodeStatus.h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YCYPasscodeStatus){
    /* The passcode status was unknown */
    YCYPasscodeStatusUnknown   = 0,
    /* The passcode is enabled */
    YCYPasscodeStatusEnabled   = 1,
    /* The passcode is disabled */
    YCYPasscodeStatusDisabled  = 2
};

@interface UIDevice (YCYPasscodeStatus)

/**
 *  Determines if the device supports the `passcodeStatus` check. Passcode check is only supported on iOS 8.
 */
@property (readonly) BOOL ycy_passcodeStatusSupported;

/**
 *  Checks and returns the devices current passcode status.
 *  If `passcodeStatusSupported` returns NO then `LNPasscodeStatusUnknown` will be returned.
 */
@property (readonly) YCYPasscodeStatus ycy_passcodeStatus;

@end
