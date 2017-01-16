//
//  NSString+YCYEncrypt.m
//
//  Created by Jakey on 15/1/26.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSString+YCYEncrypt.h"
#import "NSData+YCYEncrypt.h"
#import "NSData+YCYBase64.h"

@implementation NSString (YCYEncrypt)
-(NSString*)ycy_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] ycy_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted ycy_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)ycy_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData ycy_dataWithBase64EncodedString:self] ycy_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)ycy_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] ycy_encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted ycy_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)ycy_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData ycy_dataWithBase64EncodedString:self] ycy_decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

@end
