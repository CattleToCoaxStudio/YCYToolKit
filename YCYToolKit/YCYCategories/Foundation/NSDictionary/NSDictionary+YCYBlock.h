//
//  NSDictionary+YCYBlock.h
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YCYBlock)

#pragma mark - RX
- (void)ycy_each:(void (^)(id k, id v))block;
- (void)ycy_eachKey:(void (^)(id k))block;
- (void)ycy_eachValue:(void (^)(id v))block;
- (NSArray *)ycy_map:(id (^)(id key, id value))block;
- (NSDictionary *)ycy_pick:(NSArray *)keys;
- (NSDictionary *)ycy_omit:(NSArray *)key;

@end
