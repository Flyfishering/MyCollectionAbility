
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
}
@end
