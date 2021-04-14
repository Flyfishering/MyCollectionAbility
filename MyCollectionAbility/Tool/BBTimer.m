//
//  BBTimer.m
//  MyCollectionAbility
//
//  Created by Apple on 2021/4/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "BBTimer.h"

@interface BBTimer()
@property(nonatomic, strong) dispatch_queue_t queue;
@property(nonatomic, strong) dispatch_source_t source;
@property(nonatomic, assign) BOOL isRunning;
@property(nonatomic, copy) void(^completeBlock)(BBTimer *timer);
@property(nonatomic, assign) NSTimeInterval timeInterval;
@end


@implementation BBTimer

+ (BBTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval block:(void(^)(BBTimer *timer))block
{
    BBTimer *timer = [BBTimer new];
    timer.isRunning = NO;
    timer.timeInterval = timeInterval;
    timer.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    
    uint64_t interval = (uint64_t) (timeInterval * NSEC_PER_SEC);
    dispatch_source_set_timer(timer.source, DISPATCH_TIME_NOW, interval, 0);
    
    dispatch_source_set_event_handler(timer.source, ^{
        if (block) block(timer);
    });
    
    return timer;
}

///  开始/暂停
- (void)resume
{
    if (self.isRunning) {
        self.isRunning = NO;
        dispatch_suspend(self.source);
    }else{
        self.isRunning = YES;
        dispatch_resume(self.source);
    }
}

/// 取消
- (void)cancel
{
    if (!self.isRunning) {
        dispatch_resume(self.source);
    }
    dispatch_source_cancel(self.source);
}

@end
