//
//  NSObject+YCYBlocks.h
//  PSFoundation
//
//  Created by Peter Steinberger on 24.10.10.
//  Copyright 2010 Peter Steinberger. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSObject (YCYBlocks)
+ (id)ycy_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
+ (id)ycy_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
- (id)ycy_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (id)ycy_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
+ (void)ycy_cancelBlock:(id)block;
+ (void)ycy_cancelPreviousPerformBlock:(id)aWrappingBlockHandle __attribute__ ((deprecated));

@end
