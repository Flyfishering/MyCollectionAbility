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
    
    [self raiseException:key];
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    [self raiseException:key];
}

- (void)setNilValueForKey:(NSString *)key{
    
}

- (id)objectInTransactionsAtIndex:(NSUInteger)index{
    return [_transactions objectAtIndex:index];
}

- (void)raiseException:(NSString *)key{
    NSException *exception = [NSException exceptionWithName:@"UndefinedKey" reason:[NSString stringWithFormat:@"传入了不识别的 key:%@",key] userInfo:nil];
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



- (NSArray *)arrObj{
    return @[@"100",@"101",@"102",@"103"];
}
//------------------------------ 下面三个方法 可以利用 kcv创建一个 （类似数组）TestValue (这个说法还不完善，等看完 kvc set 过程之后再完善)

// 这个方法必须有
- (NSUInteger)countOfArrayProxyObject{
    return self.arrObj.count;
}
// 下面的方法 二选一
- (NSArray *)arrayProxyObjectAtIndexes:(NSIndexSet *)indexes{
    return [self.arrObj objectsAtIndexes:indexes];
}

- (id)objectInArrayProxyObjectAtIndex:(NSUInteger)index{
    return [self.arrObj objectAtIndex:index];
}



//------------------------------

- (void)insertMutableArr:(NSArray *)array atIndexes:(NSIndexSet *)indexes{
    [self.mutableArr insertObjects:array atIndexes:indexes];
}

- (void)insertObject:(NSString *)object inMutableArrAtIndex:(NSUInteger)index{
    [self.mutableArr insertObject:object atIndex:index];
}

- (void)removeMutableArrAtIndexes:(NSIndexSet *)indexes{
    [self.mutableArr removeObjectsAtIndexes:indexes];
}
- (void)removeObjectFromMutableArrAtIndex:(NSUInteger)index{
    [self.mutableArr removeObjectAtIndex:index];
}


@end
