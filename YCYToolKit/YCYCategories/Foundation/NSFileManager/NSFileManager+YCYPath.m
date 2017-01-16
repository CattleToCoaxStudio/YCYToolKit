//
//  NSFileManager+YCYPath.m
//  Category
//
//  Created by yangchengyou on 16/12/28.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "NSFileManager+YCYPath.h"

@implementation NSFileManager (YCYPath)
+ (NSURL *)ycy_URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+ (NSString *)ycy_pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)ycy_documentsURL
{
    return [self ycy_URLForDirectory:NSDocumentDirectory];
}

+ (NSString *)ycy_documentsPath
{
    return [self ycy_pathForDirectory:NSDocumentDirectory];
}

+ (NSURL *)ycy_libraryURL
{
    return [self ycy_URLForDirectory:NSLibraryDirectory];
}

+ (NSString *)ycy_libraryPath
{
    return [self ycy_pathForDirectory:NSLibraryDirectory];
}

+ (NSURL *)ycy_cachesURL
{
    return [self ycy_URLForDirectory:NSCachesDirectory];
}

+ (NSString *)ycy_cachesPath
{
    return [self ycy_pathForDirectory:NSCachesDirectory];
}

+ (BOOL)ycy_addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

+ (double)ycy_availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.ycy_documentsPath error:nil];
    
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}
@end
