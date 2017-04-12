//
//  SingelAndBlockSingel.m
//  MyCollectionAbility
//
//  Created by mac on 17/3/4.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SingelAndBlockSingel.h"

@implementation SingelAndBlockSingel
+ (instancetype)shareManager{
    static SingelAndBlockSingel *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[SingelAndBlockSingel alloc] init];
    });
    return manager;
}
@end
