//
//  NSTimer+YCYBlocks.m
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "NSTimer+YCYBlocks.h"

@implementation NSTimer (YCYBlocks)

+(id)ycy_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(ycy_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+(id)ycy_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(ycy_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+(void)ycy_jdExecuteSimpleBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo])
    {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
