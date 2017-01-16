//
//  NSString+YCYHash.h
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (YCYHash)
@property (readonly) NSString *ycy_md5String;
@property (readonly) NSString *ycy_sha1String;
@property (readonly) NSString *ycy_sha256String;
@property (readonly) NSString *ycy_sha512String;

- (NSString *)ycy_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)ycy_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)ycy_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)ycy_hmacSHA512StringWithKey:(NSString *)key;
@end
