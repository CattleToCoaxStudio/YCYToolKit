//
//  NSBundle+YCYAppIcon.m
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//


#import "NSBundle+YCYAppIcon.h"

@implementation NSBundle (YCYAppIcon)
- (NSString*)ycy_appIconPath {
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

- (UIImage*)ycy_appIcon {
    UIImage*appIcon = [[UIImage alloc] initWithContentsOfFile:[self ycy_appIconPath]] ;
    return appIcon;
}
@end
