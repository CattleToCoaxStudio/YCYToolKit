//
//  NSString+YCYEncrypt.h
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YCYEncrypt)
- (NSString*)ycy_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)ycy_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

- (NSString*)ycy_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;
- (NSString*)ycy_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

@end
