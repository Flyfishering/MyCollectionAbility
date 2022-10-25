//
//  TimeTest.m
//  MyCollection
//
//  Created by Apple on 2022/10/24.
//  Copyright © 2022 mac. All rights reserved.
//

#import "TimeTest.h"
#import "NSTimer+BlocksSupport.h"

@interface TimeTest()

@property (nonatomic,weak) NSTimer *timer;

@end


@implementation TimeTest

- (void)dealloc
{
    [self.timer invalidate];
    NSLog(@"%s__%s",__FILE_NAME__,__func__);
}

- (instancetype)init
{
    self = [super init];
    if(self){
        __weak __typeof(self)weakSelf = self;
        self.timer =[NSTimer xx_scheduledTimerWithTimeInterval:1.0 repeats:YES block:^{
            [weakSelf timeAction];
            }];
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
