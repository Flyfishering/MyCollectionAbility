//
//  SingelAndBlockSecondObject.m
//  MyCollectionAbility
//
//  Created by mac on 17/3/4.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "SingelAndBlockSecondObject.h"
#import "SingelAndBlockSingel.h"
@implementation SingelAndBlockSecondObject
- (instancetype)init{
    
    if (self = [super init]) {
        SingelAndBlockSingel *singel = [SingelAndBlockSingel shareManager];
        singel.blockMethod = ^(){
            NSLog(@"执行block%@",[self class]);
        };
    }
    return self;
}
@end
