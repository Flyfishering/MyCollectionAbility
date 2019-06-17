
//
//  KVO_target.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "KVO_target.h"

@implementation KVO_target

@synthesize age; // for automatic KVO - age

- (id) init
{
    self = [super init];
    if (nil != self)
    {
        age = 10;
        _grade = 0;
    }
    return self;
}

- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    NSLog(@"file: %@   context: %p",NSStringFromClass([self class]), context);
    NSLog(@"file: %@    ",NSStringFromClass([self class]));
}

@end
