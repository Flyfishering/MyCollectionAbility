//
//  WBBTime.m
//  MyCollection
//
//  Created by Apple on 2022/10/25.
//  Copyright © 2022 mac. All rights reserved.
//

#import "WBBTime.h"
#import "NSTimer+BlocksSupport.h"

@interface WBBTime()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) void (^block)(int count);
@property (nonatomic, assign) int count;

@end


@implementation WBBTime

- (void)dealloc
{
    [self invalidate];
    NSLog(@"%s_%s",__FILE_NAME__,__FUNCTION__);
}

- (instancetype)initWithBlock:(void(^)(int count))block;
{
    self = [super init];
    if (self) {
        self.block = block;
        _count = 0;
    }
    return self;
}

- (void)start
{
    [self.timer fire];
}

- (void)stop
{
    [self invalidate];
}

- (void)reStart
{
    self.count = 0;
    [self start];
}

- (void)invalidate
{
    if(self.timer.isValid){
        [self.timer invalidate];
    }
    self.timer = nil;
}

//MARK: - get

- (NSTimer *)timer
{
    if(!_timer){
        __weak __typeof(self)weakSelf = self;
        _timer = [NSTimer xx_scheduledTimerWithTimeInterval:1.0 repeats:YES block:^{
            weakSelf.count++;
            if(weakSelf.block){
                weakSelf.block(weakSelf.count);
            }
        }];
    }
    return _timer;
}

@end
