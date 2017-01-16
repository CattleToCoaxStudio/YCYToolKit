//
//  NSUserDefaults+YCYiCloudSync.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (YCYiCloudSync)


/**
 iCloud数据同步存储   ：一个用户多个设备适用数据    如 阅读软件 存储进度等
 不超过1M 最多不超过1024个key

 @param value <#value description#>
 @param key <#key description#>
 @param sync <#sync description#>
 */
- (void)ycy_setValue:(id)value  forKey:(NSString *)key iCloudSync:(BOOL)sync;

- (void)ycy_setObject:(id)value forKey:(NSString *)key iCloudSync:(BOOL)sync;

- (id)ycy_valueForKey:(NSString *)key  iCloudSync:(BOOL)sync;

- (id)ycy_objectForKey:(NSString *)key iCloudSync:(BOOL)sync;

- (BOOL)ycy_synchronizeAlsoiCloudSync:(BOOL)sync;
@end
