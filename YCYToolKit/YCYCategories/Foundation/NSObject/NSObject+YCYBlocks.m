//
//  NSObject+YCYBlocks.m
//  PSFoundation
//
//  Created by Peter Steinberger on 24.10.10.
//  Copyright 2010 Peter Steinberger. All rights reserved.
//

#import "NSObject+YCYBlocks.h"
#import <dispatch/dispatch.h>

static inline dispatch_time_t ycy_dTimeDelay(NSTimeInterval time) {
    int64_t delta = (int64_t)(NSEC_PER_SEC * time);
    return dispatch_time(DISPATCH_TIME_NOW, delta);
}

@implementation NSObject (Blocks)

+ (id)ycy_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    if (!block) return nil;
    
    __block BOOL cancelled = NO;
    
    void (^wrappingBlock)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled)block();
    };

    wrappingBlock = [wrappingBlock copy];
    
	dispatch_after(ycy_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO); });
    
    return wrappingBlock;
}

+ (id)ycy_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay {
    if (!block) return nil;
    
    __block BOOL cancelled = NO;
    
    void (^wrappingBlock)(BOOL, id) = ^(BOOL cancel, id arg) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block(arg);
    };
    
    wrappingBlock = [wrappingBlock copy];
    
	dispatch_after(ycy_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO, anObject); });
    
    return wrappingBlock;
}

- (id)ycy_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    
    if (!block) return nil;
    
    __block BOOL cancelled = NO;
    
    void (^wrappingBlock)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block();
    };
    
    wrappingBlock = [wrappingBlock copy];
    
	dispatch_after(ycy_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO); });

    return wrappingBlock;
}

- (id)ycy_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay {
    if (!block) return nil;
    
    __block BOOL cancelled = NO;
    
    void (^wrappingBlock)(BOOL, id) = ^(BOOL cancel, id arg) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block(arg);
    };
    
    wrappingBlock = [wrappingBlock copy];
    
	dispatch_after(ycy_dTimeDelay(delay), dispatch_get_main_queue(), ^{  wrappingBlock(NO, anObject); });
    
    return wrappingBlock;
}

+ (void)ycy_cancelBlock:(id)block {
    if (!block) return;
    void (^aWrappingBlock)(BOOL) = (void(^)(BOOL))block;
    aWrappingBlock(YES);
}

+ (void)ycy_cancelPreviousPerformBlock:(id)aWrappingBlockHandle {
    [self ycy_cancelBlock:aWrappingBlockHandle];
}

@end
