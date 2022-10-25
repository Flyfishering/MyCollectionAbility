//
//  TimeTest_1.m
//  MyCollection
//
//  Created by Apple on 2022/10/24.
//  Copyright © 2022 mac. All rights reserved.
//

#import "TimeTest_1.h"
#import "YYWeakProxy.h"

@interface TimeTest_1()

@property (nonatomic,strong) NSTimer *timer;

@end


@implementation TimeTest_1

- (void)dealloc
{
    [self.timer invalidate];
    NSLog(@"%s__%s",__FILE_NAME__,__func__);
}


- (instancetype)init
{
    self = [super init];
    if(self){
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[YYWeakProxy proxyWithTarget:self] selector:@selector(timeAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

static int count = 0;

- (void)timeAction
{
    NSLog(@"计时: %d",count);
    count++;
}

@end

