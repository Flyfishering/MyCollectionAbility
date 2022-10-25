//
//  NSTimerDemo.m
//  MyCollection
//
//  Created by Apple on 2022/8/4.
//  Copyright © 2022 mac. All rights reserved.
//

#import "NSTimerDemo.h"
#import "TimeTest.h"
#import "TimeTest_1.h"
#import "WBBTime.h"


@implementation NSTimerDemo

- (void)test
{
//    [self test_1];
//    [self test_2];
    [self test_4];
}

- (void)test_1
{
    NSLog(@"testlog_test_1_block-------begin--------");
    NSTimer *timer = [NSTimer timerWithTimeInterval:0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"testlog_test_1_block 回调");
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"testlog_test_1_block-------end--------");
    });
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:15]];
}

- (void)test_2
{
    __block TimeTest *timeObj = [[TimeTest alloc] init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        timeObj = nil;
    });
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:15]];
}

- (void)test_3
{
    __block TimeTest_1 *timeObj = [[TimeTest_1 alloc] init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        timeObj = nil;
    });
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:15]];
}


- (void)test_4
{
    __block WBBTime *time = [[WBBTime alloc] initWithBlock:^(int count) {
        NSLog(@"WBBTime 计时: %d",count);
    }];
    
    
    [time start];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"暂停 sop");
        [time stop];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"开始 start");
        [time start];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"重新开始 reStart");
        [time reStart];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(50 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        time = nil;
    });
    

    NSLog(@"%@",time);
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:100]];
}

@end
