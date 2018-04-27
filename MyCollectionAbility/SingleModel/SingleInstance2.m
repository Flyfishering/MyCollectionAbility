//
//  SingleInstance2.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SingleInstance2.h"
static SingleInstance2 *instance = nil;
@implementation SingleInstance2
+ (void)load{
    instance = [[SingleInstance2 alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (instance == nil) {
        instance = [super allocWithZone:zone];
    }
    return instance;
}

+ (instancetype)shareInstance{
    if (instance == nil) {
        instance = [[super alloc] init];
    }
    return instance;
}

- (id)copy{
    return instance;
}

- (id)mutableCopy{
    return instance;
}
@end
