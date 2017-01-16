//
//  NSFileManager+YCYPath.h
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (YCYPath)

/* 获取沙河路径*/

/**
 Get URL of Documents directory.
 
 @return Documents directory URL.
 */
+ (NSURL *)ycy_documentsURL;

/**
 Get path of Documents directory.
 
 @return Documents directory path.
 */
+ (NSString *)ycy_documentsPath;

/**
 Get URL of Library directory.
 
 @return Library directory URL.
 */
+ (NSURL *)ycy_libraryURL;

/**
 Get path of Library directory.
 
 @return Library directory path.
 */
+ (NSString *)ycy_libraryPath;

/**
 Get URL of Caches directory.
 
 @return Caches directory URL.
 */
+ (NSURL *)ycy_cachesURL;

/**
 Get path of Caches directory.
 
 @return Caches directory path.
 */
+ (NSString *)ycy_cachesPath;

/**
 Adds a special filesystem flag to a file to avoid iCloud backup it.
 
 @param path Path to a file to set an attribute.
 */
+ (BOOL)ycy_addSkipBackupAttributeToFile:(NSString *)path;


/**
 磁盘大小

 @return 返回兆字节的空间大小
 */
+ (double)ycy_availableDiskSpace;

@end
