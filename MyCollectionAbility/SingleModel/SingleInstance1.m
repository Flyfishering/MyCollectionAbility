//
//  SingleInstance1.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SingleInstance1.h"
static SingleInstance1 * instance = nil;
@implementation SingleInstance1
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (instance == nil) {
        @synchronized(self){
            if (instance == nil) {
                instance = [super allocWithZone:zone];
            }
        }
    }
    return instance;
}

+ (instancetype)shareInstance{
    if (instance == nil) {
        @synchronized(self){
            if (instance == nil) {
                instance = [[super alloc] init];
            }
        }
    }
    return instance;
}

- (instancetype)copy{
    return instance;
}

- (instancetype)mutableCopy{
    return instance;
}

@end
