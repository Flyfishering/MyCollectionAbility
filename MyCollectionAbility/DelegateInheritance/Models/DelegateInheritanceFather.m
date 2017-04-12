//
//  DelegateInheritanceFather.m
//  MyCollectionAbility
//
//  Created by mac on 16/12/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "DelegateInheritanceFather.h"

@implementation DelegateInheritanceFather


#pragma mark - init
- (instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
    }
    return self;
}

- (void)sayILoveYou{
    NSLog(@"Father i love you");
}

@end
