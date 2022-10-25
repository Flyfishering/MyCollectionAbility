//
//  NSTimer+BlocksSupport.m
//  MyCollection
//
//  Created by Apple on 2022/10/24.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSTimer+BlocksSupport.h"

@implementation NSTimer (BlocksSupport)

+ (NSTimer *)xx_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                       repeats:(BOOL)repeats
                                         block:(void(^)(void))block;
{
    NSTimer *time = [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(xx_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
    [[NSRunLoop currentRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    return time;
}

+ (void)xx_blockInvoke:(NSTimer *)timer {
    void (^block)(void) = timer.userInfo;
    if(block) {
        block();
    }
}



@end
