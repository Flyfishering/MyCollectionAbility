//
//  InvocationObject.m
//  MyCollectionAbility
//
//  Created by seasaw on 2018/5/21.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "InvocationObject.h"

@implementation InvocationObject
- (void)methondOne{
    NSLog(@"%s",__func__);
}

+ (void)methondOne{
    NSLog(@"%s",__func__);
}
@end
