//
//  KVCBankAccount.m
//  MyCollectionAbility
//
//  Created by 斌 on 2018/3/14.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KVCBankAccount.h"

@implementation KVCBankAccount

- (id)valueForUndefinedKey:(NSString *)key{
    
    [self raiseException];
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    [self raiseException];
}

- (void)setNilValueForKey:(NSString *)key{
    
}

- (id)objectInTransactionsAtIndex:(NSUInteger)index{
    return [_transactions objectAtIndex:index];
}

- (void)raiseException{
    NSException *exception = [NSException exceptionWithName:@"UndefinedKey" reason:@"传入了不识别的 key" userInfo:nil];
    [exception raise];
}

/// KVC 可以调用私有方法，如下面的四个方法 privatMethod, getPrivatMethod,    isPrivatMethod, _privatMethod
/// 都可以通过 [obj valueForKey:@"privatMethod"] 来调用
- (NSString *)privatMethod{
    // 内部做一些操作
    return @"这只是一个方法，不是属性 也不是实类变量";
}

//- (NSString *)getPrivatMethod{
//    // 内部做一些操作
//    return @"这只是一个方法，不是属性 也不是实类变量";
//}
//
//- (NSString *)isPrivatMethod{
//    // 内部做一些操作
//    return @"这只是一个方法，不是属性 也不是实类变量";
//}
//
//- (NSString *)_privatMethod{
//    // 内部做一些操作
//    return @"这只是一个方法，不是属性 也不是实类变量";
//}

//------------------------------ 下面三个方法 可以利用 kcv创建一个 （类似数组）TestValue
// 这个方法必须有
- (NSUInteger)countOfTestValue{
    return 1;
}
// 下面的方法 二选一
- (NSArray *)TestValueAtIndexes:(NSIndexSet *)indexes{
    return @[];
}

- (id)objectInTestValueAtIndex:(NSUInteger)index{
    return @"测试";
}
//------------------------------

@end
