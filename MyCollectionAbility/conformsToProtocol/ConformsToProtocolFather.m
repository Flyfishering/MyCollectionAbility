//
//  ConformsToProtocolFather.m
//  MyCollectionAbility
//
//  Created by mac on 17/2/11.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ConformsToProtocolFather.h"

@interface ConformsToProtocolFather()<ConformsToProtocolFatherDlegate>

@end


@implementation ConformsToProtocolFather
- (instancetype)init{
    if (self = [super init]) {
        if ([self conformsToProtocol:@protocol(ConformsToProtocolFatherDlegate)]) {
            self.fatherDelegate = (id <ConformsToProtocolFatherDlegate>)self;
            
            NSLog(@"%@实现了",NSStringFromClass([self class]));
        }else{
            NSLog(@"未实现");
        }
    }
    return self;
}

- (void)callDelegateMehod{
    [self.fatherDelegate doSomething];
}

- (void)doSomething{
    NSLog(@"Father doSomething");
}

@end
