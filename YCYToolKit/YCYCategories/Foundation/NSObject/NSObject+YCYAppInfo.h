//
//  NSObject+YCYAppInfo.h
//  ycyCategories
//
//  Created by nidom on 15/9/29.
//  Copyright © 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YCYAppInfo)
-(NSString *)ycy_version;
-(NSInteger)ycy_build;
-(NSString *)ycy_identifier;
-(NSString *)ycy_currentLanguage;
-(NSString *)ycy_deviceModel;
@end
