//
//  WeakObject.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/9.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WeakObject.h"

@implementation WeakObject
- (NSString *)description{
    NSString *result = @"";
    result = [result stringByAppendingFormat:@"<%@: %p>",[self class], self];
    result = [result stringByAppendingFormat:@"name = %@",self.name];
    result = [result stringByAppendingFormat:@"age = %ld",(long)self.age];
    return result;
}
@end
