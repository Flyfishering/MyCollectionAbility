//
//  SingleInstance3.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/6.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "SingleInstance3.h"
static SingleInstance3 *instance = nil;
@implementation SingleInstance3

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SingleInstance3 alloc] init];
    });
    return instance;
}

- (id)copy{
    return instance;
}

- (id)mutableCopy{
    return instance;
}

- (NSString *)description{
    NSString *result = @"";
    result = [result stringByAppendingFormat:@"<%@: %p>",[self class], self];
    result = [result stringByAppendingFormat:@" height = %ld,",(long)self.age];
    result = [result stringByAppendingFormat:@" array = %p,",self.name];
    result = [result stringByAppendingFormat:@" object = %p,",self.obj];
    return result;
}

@end
